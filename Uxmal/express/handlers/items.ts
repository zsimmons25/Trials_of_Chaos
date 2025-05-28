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

export async function createItem(req: TypedRequest, res: TypedResponse) {
    const adminPassword = (req as import('express').Request).headers['x-admin-password'];
    if (adminPassword !== process.env.ADMIN_PASSWORD) {
        return res.status(401).json({ error: 'Unauthorized: Invalid admin password' });
    }

    const itemData = req.body;
    
    if (!itemData.item_name || !itemData.item_class || !itemData.base_type || !itemData.ilvl) {
        return res.status(400).json({ error: 'Missing required fields: item_name, item_class, base_type, ilvl' });
    }

    let connection;
    try {
        connection = await mysql.createConnection({
            host: process.env.MYSQL_HOST,
            user: process.env.MYSQL_USER,
            password: process.env.MYSQL_PASSWORD,
            database: 'items',
            port: Number(process.env.MYSQL_PORT),
        });

        console.log('Connected to the database for item creation!');


        const insertQuery = `
            INSERT INTO items (
                item_name, base_type, ilvl, enchant, sockets, implicit,
                prefix1, p1v1, p1v2, prefix2, p2v1, p2v2, prefix3, p3v1, p3v2,
                suffix1, s1v, suffix2, s2v, suffix3, s3v, corrupted, mirrored
            ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
        `;

        const values = [
            itemData.item_name,
            itemData.base_type,
            itemData.ilvl,
            itemData.enchant || null,
            itemData.sockets || null,
            itemData.implicit !== undefined && itemData.implicit !== null ? itemData.implicit : 0,
            itemData.prefix1 || null,
            itemData.p1v1 || null,
            itemData.p1v2 || null,
            itemData.prefix2 || null,
            itemData.p2v1 || null,
            itemData.p2v2 || null,
            itemData.prefix3 || null,
            itemData.p3v1 || null,
            itemData.p3v2 || null,
            itemData.suffix1 || null,
            itemData.s1v || null,
            itemData.suffix2 || null,
            itemData.s2v || null,
            itemData.suffix3 || null,
            itemData.s3v || null,
            itemData.corrupted || false,
            itemData.mirrored || false,
        ];

        const [result] = await connection.execute(insertQuery, values);
        console.log('Item created successfully:', result);

        return res.status(201).json({ 
            message: 'Item created successfully', 
            itemId: (result as any).insertId 
        });

    } catch (err) {
        console.error('Database operation failed:', err);
        return res.status(500).json({ error: 'Database error: ' + (err as Error).message });
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