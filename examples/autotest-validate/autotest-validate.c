/**
* A simple file to validate your automated test setup for AESD
*/

#include "autotest-validate.h"
#include "sys/types.h"
#include "sys/stat.h"
#include "fcntl.h"
#include "unistd.h"
#include <stdbool.h>

/**
* @return true (as you may have guessed from the name)
*/
bool this_function_returns_true()
{
    return true;
}

/**
* @return false (as you may have guessed from the name)
*/
bool this_function_returns_false()
{
    return false;
}

/**
 * @return a string which contains the username you use for
 * git submissions.  This string should match the string in conf/username.txt
 */
 char username[90]; // just enough to hold git usernames
 typedef int file;
const char *my_username()
{
    // just read the file.
    file f=open("conf/username.txt",O_RDONLY);
    char c=0;
	int remaining=1;
    int count=0;
	do {
        remaining=read(f,&c,1);
        if(remaining)username[count++]=c;
	} while(remaining);
    return username;
}
