import { createFileRoute } from '@tanstack/react-router';
import Modifiers from '../Modifiers';
import { QueryClient, QueryClientProvider } from '@tanstack/react-query';
const modifierClient = new QueryClient();

export const Route = createFileRoute('/modifiers')({
  component: () => (
    <QueryClientProvider client={modifierClient}>
      <Modifiers />
    </QueryClientProvider>
  ),
});
