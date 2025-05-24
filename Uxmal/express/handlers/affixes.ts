import { config } from 'dotenv';
config({ path: 'express/.env' });
import mysql from 'mysql2/promise';
import { Value } from '@sinclair/typebox/value';
import { TypedRequest, TypedResponse } from "express-typed";
import { AffixesData, Affix} from '../types/affixes.js';

export async function getAffixes(req: TypedRequest, res: TypedResponse) {   
    let connection;
    try {
        connection = await mysql.createConnection({
            host: process.env.MYSQL_HOST,
            user: process.env.MYSQL_USER,
            password: process.env.MYSQL_PASSWORD,
            database: 'affixes',
            port: Number(process.env.MYSQL_PORT),
            multipleStatements: true,
        });
        console.log('Connected to the database!');
        const [prefixRowsResult] = await connection.query('SELECT * FROM prefixes');
        const prefixRows = prefixRowsResult as Affix[];
        const [suffixRowsResult] = await connection.query('SELECT * FROM suffixes');
        const suffixRows = suffixRowsResult as Affix[];
        const combinedResults: Affix[] = [...prefixRows, ...suffixRows];
        console.log('Combined query results:', combinedResults);
        if (!Value.Check(AffixesData, combinedResults)) {
            console.error('Validation error:', Value.Errors(AffixesData, combinedResults));
            return res.status(500).send('Validation error');
        }
        console.log('Validation successful!');
        return res.json(combinedResults);
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