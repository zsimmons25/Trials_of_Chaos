import { defineConfig } from 'vite';
import { config } from 'dotenv';
config();
import react from '@vitejs/plugin-react';
import { TanStackRouterVite } from '@tanstack/router-vite-plugin';

// https://vitejs.dev/config/
export default defineConfig(({ mode }) => ({
  plugins: [
    react(),
    mode === 'development' ? TanStackRouterVite() : null,
  ].filter(Boolean),
  define: { 'process.env': process.env },
  server: {
    host: '0.0.0.0',
    port: 5173,
    hmr: {
      clientPort: 5173,
      overlay: false,
    },
    watch: {
      usePolling: true,
      interval: 1000,
    },
  },
  optimizeDeps: {
    include: [
      'react',
      'react-dom',
      '@tanstack/react-query',
      '@sinclair/typebox/value',
    ],
  },
}));
