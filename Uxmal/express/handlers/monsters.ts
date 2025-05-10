import { config } from 'dotenv';
config({ path: 'express/.env' });
import mysql from 'mysql2/promise';
import { RowDataPacket } from 'mysql2';
import { Value } from '@sinclair/typebox/value';
import { TypedRequest, TypedResponse } from "express-typed";
import { MonstersData } from '../types/monster.js';

const ALLOWED = [
  'CrestedBehemoth','StonecladGorilla','CerebralBat', 'PetulantStonemaw', 'ScuteLizard', 'SaurianServant', 'BloodriteGuardDW', 'BloodriteGuard2H', 'ChaosZealotDagger', 'ChaosZealotSpear', 'BloodritePriest', 'BahlakTheSkySeer', 'ChetzaTheFeatheredPlague', 'UxmalTheBeastlord', 'TheTrialmaster'
] as const;
type MonsterSlug = typeof ALLOWED[number];

export async function getMonsters(
  req: TypedRequest<{ query: { monster?: MonsterSlug } }>,
  res: TypedResponse
) {
  const table = req.query.monster;

  if (!table) {
    return res.status(400).send('Missing monster query parameter');
  }

  if (!ALLOWED.includes(table)) {
    return res.status(400).send('Invalid monster specified');
  }

  let connection;
  try {
    connection = await mysql.createConnection({
      host: process.env.MYSQL_HOST,
      user: process.env.MYSQL_USER,
      password: process.env.MYSQL_PASSWORD,
      database: 'monsters',
      port: Number(process.env.MYSQL_PORT),
    });

    const [results] = await connection.query<RowDataPacket[]>(
      `SELECT * FROM \`${table}\``
    );

    if (!Value.Check(MonstersData, results)) {
      console.error('Validation error:', Value.Errors(MonstersData, results));
      return res.status(500).send('Validation error');
    }

    return res.json(results);
  } catch (err) {
    console.error('Database operation failed:', err);
    return res.status(500).send('Database error: ' + (err as Error).message);
  } finally {
    if (connection) {
      try {
        await connection.end();
      } catch (e) {
        console.error('Error disconnecting:', e);
      }
    }
  }
}