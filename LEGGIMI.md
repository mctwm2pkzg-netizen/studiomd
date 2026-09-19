# StudioMD sul web: GitHub Pages + Supabase

Risultato: un indirizzo tipo `https://TUONOME.github.io/studiomd/` che apri da telefono e computer.
L'app pubblicata è vuota: carte, progressi e immagini arrivano dal tuo account Supabase dopo l'accesso.

## 1. Supabase (una volta sola, 5 minuti)
1. Vai su https://supabase.com, crea un account e un **New project** (piano Free, regione europea).
2. Menu **SQL Editor** → **New query** → incolla tutto il contenuto di `supabase.sql` → **Run**.
3. Menu **Project Settings → API**: copia **Project URL** e la chiave **anon / publishable**.
   Mai la chiave `service_role` / `secret`: quella non deve finire in nessun file.
4. Apri `config.js` nella cartella LEZIONI (quello accanto a StudioMD.html) e incolla i due valori tra le virgolette.
5. Consigliato: **Authentication → Sign In / Providers → Email** → disattiva «Confirm email» (così l'account si crea subito).

## 2. Primo accesso dal computer
1. Apri `StudioMD.html` → in basso a sinistra **☁ Accedi per sincronizzare** → **Crea account** (email e password a tua scelta).
2. L'app carica nel cloud gli appunti della cartella `flashcards/`, i progressi e le immagini (ridotte).
3. Fatto l'account, in Supabase: **Authentication → Sign In / Providers** → disattiva **Allow new users to sign up**.
   Così nessun altro può registrarsi sul tuo progetto.

## 3. GitHub Pages (una volta sola)
1. Nel Terminale, dalla cartella LEZIONI: `python3 pubblica_webapp.py` (aggiorna la cartella `webapp/` con l'ultima versione e il tuo `config.js`).
2. Su https://github.com crea un repository **pubblico**, ad esempio `studiomd` (senza README).
3. Nella pagina del repository: **uploading an existing file** → trascina **tutto il contenuto** di `webapp/` (non la cartella stessa) → **Commit changes**.
   Dal Finder i file che iniziano col punto non si vedono: `.nojekyll` non è indispensabile.
4. **Settings → Pages** → Source: **Deploy from a branch** → Branch: `main`, cartella `/ (root)` → **Save**. Dopo 1-2 minuti l'indirizzo è attivo.

Nel repository finiscono solo l'app e la chiave pubblica. Nessuna flashcard, nessun materiale di lezione.

## 4. Sul telefono
1. Apri l'indirizzo → **☰ → ☁ Accedi** con la stessa email e password.
2. Aggiungi alla schermata Home: iPhone (Safari) **Condividi → Aggiungi alla schermata Home**; Android (Chrome) **⋮ → Installa app**.
3. **🚶 Ripassa camminando**: schermo intero, pulsanti enormi, voce. Funziona anche senza rete: si sincronizza appena torna la connessione.

## Tutti i giorni
- Le carte si scrivono sul computer (Cowork / Claude nella cartella `flashcards/`). Arrivano al telefono dopo che hai aperto `StudioMD.html` sul computer: è lui che le carica nel cloud.
- I ripassi si sincronizzano da soli: all'apertura, dopo ogni sessione, quando torni sull'app. Se la stessa carta è ripassata su due dispositivi, vale il ripasso più recente.
- Quando l'app viene aggiornata: `python3 pubblica_webapp.py`, poi ricarica su GitHub `index.html` e `sw.js` (Add file → Upload files).
