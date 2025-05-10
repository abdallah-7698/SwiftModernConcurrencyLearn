### 🖥 Running a Local Python3 Server for the Swift Project

To serve the `Data` folder locally so that the Swift project can fetch data from it, follow these steps:

1. Open a terminal.
2. Navigate to the root of the repo (where the `Data` folder is located).
3. Run the following command:

```bash
cd Data
python3 -m http.server 8080
