import { config } from 'dotenv';
config({ path: 'express/.env' });
import { TypedRequest, TypedResponse } from "express-typed";
import mysql from 'mysql2';

export function getModifiers(req: TypedRequest, res: TypedResponse) {   
    const connection = mysql.createConnection({
        host: process.env.MYSQL_HOST,
        user: process.env.MYSQL_USER,
        password: process.env.MYSQL_PASSWORD,
        database: 'modifiers',
        port: Number(process.env.MYSQL_PORT),
        multipleStatements: true,
    });

    connection.connect((err) => {
        if (err) {
            console.error('Error connecting to the database:', err);
            return res.status(500).send('Database connection error');
        }
        console.log('Connected to the database!');
    });
    connection.query('SELECT * FROM modifiers', (err, results) => {
        if (err) {
            console.error('Error executing query:', err);
            return res.status(500).send('Query execution error');
        }
        console.log('Query results:', results);
        res.json(results);
    });
    connection.end((err) => {
        if (err) {
            console.error('Error disconnecting from the database:', err);
            return res.status(500).send('Database disconnection error');
        }
        console.log('Disconnected from the database!');
    });
    }