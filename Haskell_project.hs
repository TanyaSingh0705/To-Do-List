import System.IO

main :: IO ()
main = do
  putStrLn "Welcome to your To-Do List!"
  toDoListLoop []

toDoListLoop :: [String] -> IO ()
toDoListLoop toDoList = do
  putStrLn "What would you like to do?"
  putStrLn "1. Add a task"
  putStrLn "2. View tasks"
  putStrLn "3. Exit"
  choice <- getLine
  case choice of
    "1" -> do
      putStrLn "Enter a task:"
      task <- getLine
      let updatedList = toDoList ++ [task]
      putStrLn "Task added!"
      toDoListLoop updatedList
    "2" -> do
      putStrLn "Your tasks:"
      printTasks toDoList
      toDoListLoop toDoList
    "3" -> putStrLn "Goodbye!"
    _ -> do
      putStrLn "Invalid choice. Please try again."
      toDoListLoop toDoList

printTasks :: [String] -> IO ()
printTasks [] = putStrLn "No tasks."
printTasks (task:tasks) = do
  putStrLn ("- " ++ task)
  printTasks tasks

