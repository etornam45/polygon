#include <iostream>
#include <vector>
#include <string>

using namespace std;

int main(int argc, char *argv[])
{
    vector<string> v;
    v.push_back("Hello, ");
    v.push_back("world!");
    for (int i = 0; i < v.size(); i++)
    {
        cout << v[i];
    }
    cout << endl;
    return 0;
}