import { createFileRoute } from '@tanstack/react-router';
import Modifiers from '../Modifiers';
import { QueryClient, QueryClientProvider } from '@tanstack/react-query';
const queryClient = new QueryClient();

export const Route = createFileRoute('/modifiers')({
  component: () => (
    <QueryClientProvider client={queryClient}>
      <Modifiers />
    </QueryClientProvider>
  ),
});
