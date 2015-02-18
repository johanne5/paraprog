#include <iostream>

#include "tbb/task_scheduler_init.h"
#include "tbb/task.h"
#include "tbb/tick_count.h"
#include <cstdlib>

struct binary_tree {
    long node_count;
	float data;
	binary_tree *left;
	binary_tree *right;
};

binary_tree* tree;
static double Pi = 3.14159265358979;
long number_of_nodes = 10000000;


// Recursive tree traversal
float SerialTreeTraversal (binary_tree* root) {
    float result = root->data;
    if (root->left)
        result += SerialTreeTraversal (root->left);
    if (root->right)
        result += SerialTreeTraversal (root->right);
    return result;
}




binary_tree* CreateASubTree (long number_of_nodes) {
	if (number_of_nodes == 0) {
        return NULL;
    } else {
        binary_tree *node = new binary_tree ();
        node->node_count = number_of_nodes;
        node->data = (float)Pi*number_of_nodes;
        --number_of_nodes;
        node->left  = CreateASubTree (number_of_nodes/2);
        node->right = CreateASubTree (number_of_nodes - number_of_nodes/2);
        return node;
    }
}

void DeleteATree (binary_tree* node) {
	//...
}

class MyRecursiveTask: public tbb::task {
	binary_tree *root;
    float *const sum;
public:
	MyRecursiveTask (binary_tree *root_, float *sum_): root (root_), sum (sum_) {}

	tbb::task* execute () {
        if (root->node_count < 1000) {
            *sum = SerialTreeTraversal (root);
        } else {
            float x, y;    

            int count = 1;

            tbb::task_list list;

            if( root->left ) {
                ++count;
                list.push_back (*new (allocate_child()) MyRecursiveTask (root->left, &x));
            }
            if( root->right ) {
                ++count;
                list.push_back (*new (allocate_child()) MyRecursiveTask (root->right, &y));
            }

            set_ref_count (count);
            spawn_and_wait_for_all (list);

            *sum = root->data;
            if (root->left)  *sum += x;
            if (root->right) *sum += y;
        }
        return NULL;
	}
};


void original () {
    float sum;
	tbb::tick_count before = tbb::tick_count::now ();
	sum = SerialTreeTraversal (tree);
	tbb::tick_count after = tbb::tick_count::now ();

	std::cout << "Serial tree traversal: " << (after-before).seconds () << " seconds, sum equals to " << sum << std::endl;
}

void improved () {
    float sum;
	tbb::tick_count before = tbb::tick_count::now ();
	tbb::task& root_task = *new (tbb::task::allocate_root ()) MyRecursiveTask (tree, &sum);
	tbb::task::spawn_root_and_wait (root_task);
	tbb::tick_count after = tbb::tick_count::now ();

	std::cout << "TBB tree traversal: " << (after-before).seconds () << " seconds, sum equals to " << sum << std::endl;
}

int main (void) {
  int Nthreads=1;
	tree = new binary_tree();
    tree->node_count = number_of_nodes;
    tree->data = (float)Pi*number_of_nodes;
    --number_of_nodes;
	tree->left = CreateASubTree (number_of_nodes/2);
	tree->right = CreateASubTree (number_of_nodes - number_of_nodes/2);

	original ();


	Nthreads = atoi(getenv("OMP_NUM_THREADS"));

	tbb::task_scheduler_init tbb_init(Nthreads);
	improved ();

	DeleteATree (tree);
	return 0;
}
