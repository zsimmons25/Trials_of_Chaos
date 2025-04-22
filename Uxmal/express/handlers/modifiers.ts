import { config } from 'dotenv';
config({ path: 'express/.env' });
import mysql from 'mysql2/promise';
import { Value } from '@sinclair/typebox/value';
import { TypedRequest, TypedResponse } from "express-typed";
import { ModifiersData } from '../types/modifier.js';

export async function getModifiers(req: TypedRequest, res: TypedResponse) {   
    let connection;
    try {
        connection = await mysql.createConnection({
            host: process.env.MYSQL_HOST,
            user: process.env.MYSQL_USER,
            password: process.env.MYSQL_PASSWORD,
            database: 'modifiers',
            port: Number(process.env.MYSQL_PORT),
            multipleStatements: true,
        });
        console.log('Connected to the database!');
        const [results] = await connection.query('SELECT * FROM modifiers');
        console.log('Query results:', results);
        if (!Value.Check(ModifiersData, results)) {
            console.error('Validation error:', Value.Errors(ModifiersData, results));
            return res.status(500).send('Validation error');
        }
        console.log('Validation successful!');
        return res.json(results);
    } catch (err) {
        console.error('Database operation failed:', err);
        return res.status(500).send('Database error: ' + (err as Error).message);
    } finally {
        if (connection) {
            try {
                await connection.end();
                console.log('Disconnected from the database!');
            } catch (err) {
                console.error('Error disconnecting from the database:', err);
            }
        }
    }
}