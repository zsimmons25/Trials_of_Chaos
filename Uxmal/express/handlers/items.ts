import { config } from 'dotenv';
config({ path: 'express/.env' });
import mysql from 'mysql2/promise';
import { Value } from '@sinclair/typebox/value';
import { TypedRequest, TypedResponse } from "express-typed";
import { ItemsData, BasesData } from '../types/items.js';

export async function getItems(req: TypedRequest, res: TypedResponse) {   
    let connection;
    try {
        connection = await mysql.createConnection({
            host: process.env.MYSQL_HOST,
            user: process.env.MYSQL_USER,
            password: process.env.MYSQL_PASSWORD,
            database: 'items',
            port: Number(process.env.MYSQL_PORT),
            multipleStatements: true,
        });
        console.log('Connected to the database!');
        const [itemResults] = await connection.query('SELECT * FROM items');
        console.log('Query results:', itemResults);
        if (!Value.Check(ItemsData, itemResults)) {
            console.error('Item Validation error:', Value.Errors(ItemsData, itemResults));
            return res.status(500).send('Item Validation error');
        }
        console.log('Item Validation successful!');
        
        const [baseResults] = await connection.query('SELECT * FROM bases');
        console.log('Base query results:', baseResults);
        if (!Value.Check(BasesData, baseResults)) {
            const validationErrors = [...Value.Errors(BasesData, baseResults)];
            console.error('Base validation error:', JSON.stringify(validationErrors, null, 2));
            return res.status(500).send('Base validation error');
        }
        console.log('Base validation successful!');

        return res.json({ items: itemResults, bases: baseResults });
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