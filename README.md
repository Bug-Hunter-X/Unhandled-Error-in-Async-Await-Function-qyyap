# Unhandled Error in Async/Await Function

This example demonstrates a common error in Swift's async/await functions: forgetting to handle potential errors appropriately. The `fetchData` function makes an asynchronous API call. If the request fails (e.g., due to network issues or a server error), it throws a `URLError`. However, the `Task` block that calls `fetchData` only prints a generic error message, losing potentially valuable error information.

## Bug

The `bug.swift` file contains the erroneous code.  The error handling is inadequate; it doesn't provide specific details about what went wrong during the API call.

## Solution

The `bugSolution.swift` file shows the corrected code.  The solution includes more robust error handling, specifically using a `switch` statement to handle different types of `URLError`s and providing more informative error messages.