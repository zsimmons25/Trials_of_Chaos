import { defineConfig } from 'vite';
import { config } from 'dotenv';
config();
import react from '@vitejs/plugin-react';
import { TanStackRouterVite } from '@tanstack/router-vite-plugin';

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [react(), TanStackRouterVite()],
  define: { 'process.env': process.env },
});
