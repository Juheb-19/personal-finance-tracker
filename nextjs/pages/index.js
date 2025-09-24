import React from 'react';

export default function Home() {
  return (
    <main style={{fontFamily:'Inter, sans-serif', padding:24}}>
      <h1>Personal Finance Tracker (Starter)</h1>
      <p>This is a minimal dashboard starter. Connect your Supabase keys in <code>.env.local</code>.</p>
      <p>Features to add:</p>
      <ul>
        <li>Transaction list</li>
        <li>Quick add via WhatsApp/Telegram</li>
        <li>Budgets & alerts</li>
        <li>Monthly reports & charts</li>
      </ul>
    </main>
  )
}
