# 127Co

This repository is a collaboration of the different departments as part of the
`CMSC 127` course in University of the Philippines Baguio.

## Some Notes

Each department has a dedicated file for their respective `sql` queries in the `database/` folder.
Make sure you source each file on the `database/init.sql` file.

## Running the Project

This project assumes that you have `mysql` installed and on your `PATH`, having
an empty string as it's password (see `src/lib/database.ts`).

Now to run the frontend and the server invoke the following commands,
```bash
# install node dependencies
npm install
# run the frontend and the server
npm run dev
```

You can also invoke `npm run format` to automatically format your code before making a PR.
