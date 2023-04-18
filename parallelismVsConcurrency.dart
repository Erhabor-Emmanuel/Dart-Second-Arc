//Parallelism is when multiple tasks run at the same time on multiple processors or CPU cores.
//Concurrency, on the other hand, is when multiple tasks take turns running on a single CPU core.

//******* A problem with parallelism ********
//So the problem isn’t so much with parallelism itself, but rather with multiple threads
// having access to the same state in memory.

//Dart isolates
//Dart’s single thread runs in what it calls an isolate. Each isolate has its own allocated memory area,
//which ensures that no isolate can access any other isolate’s state. 


//Synchronous vs. asynchronous code
//Synchronous code is where each instruction is executed in order, one line of code immediately
// following the previous one.

//Dart manage to schedule tasks asynchronously using what it called an event loop
// to execute tasks that had previously been postponed.
//The event loop has two queues: a microtask queue and an event queue.
// The microtask queue is mostly used internally by Dart.
//The event queue is for events like a user entering a keystroke or
// touching the screen, or data coming from a database, file, or remote server. 

//When Dart is finished running the synchronous tasks, the event loop checks the microtask queue.
// If the microtask queue has any tasks, the event loop puts them on the main thread to execute next.
//The event loop keeps checking the microtask queue until it’s empty.
//If the synchronous tasks and microtask queue are both empty, 
//then the event loop sends the next waiting task in the event queue to run in the main thread.  


//********Getting the result with callbacks
//A callback is an anonymous function that will run after some event has completed. 