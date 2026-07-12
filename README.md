# 🗓 Calendário da Agência

App de calendário de postagens para agências de social media. Funciona no computador e celular, com sincronização em tempo real via Firebase.

---

## 🚀 Como Abrir Localmente (Computador)

1. Abra o **PowerShell** na pasta do projeto
2. Execute: `powershell -ExecutionPolicy Bypass -File server.ps1`
3. O app abrirá automaticamente em `http://localhost:8080`

---

## 📱 Como Acessar no Celular (na mesma rede Wi-Fi)

1. Inicie o servidor no computador conforme acima
2. Descubra o IP do seu computador: rode `ipconfig` no prompt e veja o **IPv4**
3. No celular, abra o navegador e acesse: `http://192.168.1.X:8080` (substitua pelo seu IP)

> ⚠️ Para sincronizar entre dispositivos você precisa do Firebase (veja abaixo)

---

## 🔗 Como Configurar Sincronização Firebase (GRÁTIS)

A sincronização entre celular e computador é feita via **Firebase Firestore** (plano gratuito).

### Passo a passo:

1. Acesse [console.firebase.google.com](https://console.firebase.google.com)
2. Clique em **"Adicionar projeto"**
3. Dê um nome (ex: `minha-agencia`) e crie o projeto
4. No menu lateral, clique em **"Firestore Database"** → **"Criar banco de dados"** → Escolha **"Modo de teste"**
5. No menu lateral, clique no ⚙️ (engrenagem) → **"Configurações do projeto"**
6. Role para baixo até **"Seus aplicativos"** → clique em **"</>  Web"**
7. Registre o app com qualquer nome → copie o objeto `firebaseConfig`
8. No app, clique no ícone **🔗** no canto superior direito
9. Cole as informações e clique em **"Conectar e Sincronizar"**

Pronto! Agora o app sincroniza em tempo real entre todos os dispositivos! ✅

---

## 📋 Funcionalidades

- ✅ Calendário mensal (Julho/2026 a Dezembro/2030)
- ✅ Múltiplos clientes com cores personalizadas (código HEX)
- ✅ Gradiente de cores nos dias com múltiplas postagens
- ✅ 4 tipos de conteúdo: Reels, Feed, Carrossel, Foto
- ✅ Clique no dia para adicionar/ver postagens
- ✅ Anotações por postagem
- ✅ Gerenciamento completo de clientes
- ✅ Sincronização em tempo real via Firebase
- ✅ Responsivo (mobile + desktop)
- ✅ Funciona offline com dados locais
