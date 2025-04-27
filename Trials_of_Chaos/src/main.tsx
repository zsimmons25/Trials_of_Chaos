import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import { Suspense } from 'react';
import { ErrorBoundary } from 'react-error-boundary';
import { RouterProvider, createRouter } from '@tanstack/react-router';
import { QueryClient, QueryClientProvider } from '@tanstack/react-query';
import { routeTree } from './routeTree.gen.ts';

export const queryClient = new QueryClient();
const router = createRouter({
  routeTree,
  context: { queryClient },
  defaultPreloadDelay: 250,
});

declare module '@tanstack/react-router' {
  interface Register {
    router: typeof router;
  }
}

const rootElement = document.getElementById('root')!;
if (!rootElement.innerHTML) {
  const root = ReactDOM.createRoot(rootElement);
  root.render(
    <React.StrictMode>
      <ErrorBoundary fallback={<div>Error encountered</div>}>
        <QueryClientProvider client={queryClient}>
          <Suspense fallback={<div>Loading...</div>}>
            <RouterProvider router={router} />
          </Suspense>
        </QueryClientProvider>
      </ErrorBoundary>
    </React.StrictMode>
  );
}
