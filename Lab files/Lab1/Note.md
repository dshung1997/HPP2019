1. gcc -o AAA BBB.c -> -o tells the compiler to call the output file as AAA
2. target: dependency1 dependency2
    <TAB>command-to-create-target
    There must be a tab in front of the second command.

3. make will run the file called makefile (or Makefile) and build the first target (and therefore also any other targets that are dependencies of the first target).

4. -w flag of gcc turns off all warnings.

5. make -f AAA -> run make with file AAA

6. "define NDEBUG" before assert.h will eliminate all assert statements.

7. gcc -g flag to save debug info within the executable.

8. compile with the above flag (with the output file XXX) and then run gdb ./XXX. Type run or just r to start the program, q will exit gdb

9. 