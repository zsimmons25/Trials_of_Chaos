import { createFileRoute } from '@tanstack/react-router';
import { useState, useEffect } from 'react';
import Entry from '../Entry';

function ProtectedEntry() {
  const [isAuthorized, setIsAuthorized] = useState(false);
  const [password, setPassword] = useState('');
  const [error, setError] = useState('');

  useEffect(() => {
    const authorized = sessionStorage.getItem('admin_authorized');
    if (authorized === 'true') {
      setIsAuthorized(true);
    }
  }, []);

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();

    const ADMIN_PASSWORD = import.meta.env.VITE_ADMIN_PASSWORD;

    if (password === ADMIN_PASSWORD) {
      setIsAuthorized(true);
      sessionStorage.setItem('admin_authorized', 'true');
      setError('');
    } else {
      setError('Invalid password');
      setPassword('');
    }
  };

  if (isAuthorized) {
    return <Entry />;
  }

  return (
    <div className='flex min-h-screen items-center justify-center bg-gray-900'>
      <div className='w-full max-w-md rounded-lg bg-gray-800 p-6'>
        <h2 className='mb-6 text-center text-2xl font-bold text-white'>
          Admin Access Required
        </h2>

        <form onSubmit={handleSubmit} className='space-y-4'>
          <div>
            <label className='mb-2 block text-sm font-medium text-white'>
              Password
            </label>
            <input
              type='password'
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              className='w-full rounded-md border border-gray-600 bg-gray-700 px-3 py-2 text-white'
              placeholder='Enter admin password'
              required
            />
          </div>

          {error && <div className='text-sm text-red-500'>{error}</div>}

          <button
            type='submit'
            className='w-full rounded-md bg-blue-600 px-4 py-2 text-white hover:bg-blue-700'
          >
            Access Entry Form
          </button>
        </form>
      </div>
    </div>
  );
}

export const Route = createFileRoute('/entry')({
  component: ProtectedEntry,
});
