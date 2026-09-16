document.addEventListener("DOMContentLoaded", function () {
  const password = "Mellon";
  const sessionKey = "introR_materials_access";
  const body = document.body;
  const overlayId = "introR-access-overlay";

  if (sessionStorage.getItem(sessionKey) === "granted") {
    return;
  }

  function createLoginOverlay() {
    const existing = document.getElementById(overlayId);
    if (existing) {
      return existing;
    }

    const prefersDarkMode = window.matchMedia("(prefers-color-scheme: dark)").matches;
    const palette = prefersDarkMode ? {
      overlayBg: "rgba(15, 23, 42, 0.82)",
      cardBg: "rgba(17, 24, 39, 0.94)",
      border: "#374151",
      text: "#f9fafb",
      muted: "#d1d5db",
      badgeBg: "rgba(37, 99, 235, 0.18)",
      badgeText: "#bfdbfe",
      inputBg: "#0b1220",
      inputText: "#f9fafb",
      inputBorder: "#4b5563",
      inputFocus: "rgba(96, 165, 250, 0.3)",
      error: "#fca5a5",
      divider: "#374151",
      link: "#93c5fd",
      buttonStart: "#3b82f6",
      buttonEnd: "#1d4ed8"
    } : {
      overlayBg: "rgba(15, 23, 42, 0.18)",
      cardBg: "rgba(255,255,255,0.96)",
      border: "#e5e7eb",
      text: "#111827",
      muted: "#4b5563",
      badgeBg: "#eef5ff",
      badgeText: "#1d4ed8",
      inputBg: "#fff",
      inputText: "#111827",
      inputBorder: "#d1d5db",
      inputFocus: "rgba(37, 99, 235, 0.12)",
      error: "#b91c1c",
      divider: "#e5e7eb",
      link: "#1d4ed8",
      buttonStart: "#2d6cdf",
      buttonEnd: "#1d4ed8"
    };

    const overlay = document.createElement("div");
    overlay.id = overlayId;
    overlay.setAttribute("role", "dialog");
    overlay.setAttribute("aria-modal", "true");
    overlay.setAttribute("aria-labelledby", "introR-access-heading");
    overlay.style.position = "fixed";
    overlay.style.inset = "0";
    overlay.style.zIndex = "99999";
    overlay.style.display = "flex";
    overlay.style.alignItems = "center";
    overlay.style.justifyContent = "center";
    overlay.style.padding = "32px 20px";
    overlay.style.background = palette.overlayBg;
    overlay.style.backdropFilter = "blur(3px)";
    overlay.style.fontFamily = '"Segoe UI", Arial, sans-serif';

    overlay.innerHTML = `
      <style>
        .introR-access-card {
          width: min(100%, 460px);
          padding: clamp(1.5rem, 4vw, 2rem) clamp(1.15rem, 4vw, 1.75rem) 1.5rem;
          border: 1px solid ${palette.border};
          border-radius: 16px;
          background: ${palette.cardBg};
          box-shadow: 0 12px 28px rgba(15, 23, 42, 0.08);
          text-align: center;
          color: ${palette.text};
        }

        .introR-access-badge {
          display: inline-block;
          margin-bottom: 0.9rem;
          padding: 0.45rem 0.7rem;
          border-radius: 999px;
          background: ${palette.badgeBg};
          color: ${palette.badgeText};
          font-size: clamp(0.7rem, 1.5vw, 0.8rem);
          font-weight: 700;
          letter-spacing: 0.06em;
          text-transform: uppercase;
        }

        .introR-access-badge a {
          color: inherit;
          text-decoration: none;
        }

        .introR-access-title {
          margin: 0 0 0.75rem;
          font-size: clamp(1.8rem, 3vw, 2.3rem);
          line-height: 1.2;
          color: ${palette.text};
        }

        .introR-access-subtitle {
          margin: 0 0 1.35rem;
          font-size: clamp(1rem, 2vw, 1.1rem);
          line-height: 1.6;
          color: ${palette.muted};
        }

        .introR-access-form {
          text-align: left;
        }

        .introR-access-label {
          display: block;
          margin: 0 0 0.55rem;
          font-size: clamp(0.95rem, 2vw, 1rem);
          font-weight: 600;
          color: ${palette.text};
        }

        .introR-access-input {
          width: 100%;
          box-sizing: border-box;
          min-height: 48px;
          padding: 0.85rem 0.9rem;
          margin-bottom: 1rem;
          border: 1px solid ${palette.inputBorder};
          border-radius: 10px;
          background: ${palette.inputBg};
          color: ${palette.inputText};
          font-size: clamp(1rem, 2vw, 1.05rem);
          outline: none;
          transition: border-color 0.2s ease, box-shadow 0.2s ease;
        }

        .introR-access-input:focus {
          border-color: ${palette.link};
          box-shadow: 0 0 0 3px ${palette.inputFocus};
        }

        .introR-access-checkbox {
          display: flex;
          align-items: center;
          gap: 0.65rem;
          margin: 0 0 1.1rem;
          color: ${palette.muted};
          font-size: clamp(0.92rem, 1.8vw, 1rem);
          cursor: pointer;
        }

        .introR-access-checkbox input {
          width: 1.1rem;
          height: 1.1rem;
          cursor: pointer;
        }

        .introR-access-button {
          width: 100%;
          min-height: 48px;
          padding: 0.8rem 1rem;
          border: none;
          border-radius: 10px;
          background: linear-gradient(180deg, ${palette.buttonStart} 0%, ${palette.buttonEnd} 100%);
          color: #fff;
          font-size: clamp(1rem, 2vw, 1.05rem);
          font-weight: 600;
          cursor: pointer;
          box-shadow: 0 8px 16px rgba(29, 78, 216, 0.18);
          transition: transform 0.15s ease, box-shadow 0.15s ease;
        }

        .introR-access-button:hover,
        .introR-access-button:focus-visible {
          transform: translateY(-1px);
          box-shadow: 0 10px 18px rgba(29, 78, 216, 0.22);
          outline: 3px solid rgba(191, 219, 254, 0.7);
          outline-offset: 2px;
        }

        .introR-access-error {
          min-height: 1.25rem;
          margin: 0.9rem 0 0;
          color: ${palette.error};
          font-size: clamp(0.9rem, 1.8vw, 0.95rem);
          line-height: 1.5;
        }

        .introR-access-contact {
          margin-top: 1.6rem;
          padding-top: 1rem;
          border-top: 1px solid ${palette.divider};
          font-size: clamp(0.8rem, 1.8vw, 0.9rem);
          line-height: 1.5;
          color: ${palette.muted};
        }

        .introR-access-contact a {
          color: ${palette.link};
          text-decoration: none;
          font-weight: 500;
        }

        .introR-access-contact a:hover,
        .introR-access-contact a:focus-visible {
          text-decoration: underline;
          outline: 2px solid transparent;
        }

        @media (max-width: 480px) {
          .introR-access-card {
            border-radius: 12px;
          }
        }
      </style>

      <div class="introR-access-card" aria-labelledby="introR-access-heading">
        <div class="introR-access-badge">
          <a href="https://luc-hoskova.github.io/introR_CUNI/" aria-label="Přejít na domovskou stránku kurzu">
            Zpracování výzkumných dat v R
          </a>
        </div>

        <h1 id="introR-access-heading" class="introR-access-title">Přístup k výukovým materiálům</h1>
        <p class="introR-access-subtitle">Výukové materiály jsou určeny aktivním studentům kurzu. Pro přístup zadejte heslo.</p>

        <form class="introR-access-form" novalidate aria-describedby="introR-access-error">
          <label class="introR-access-label" for="introR-access-password">Heslo</label>
          <input
            id="introR-access-password"
            class="introR-access-input"
            type="password"
            placeholder="Zadejte heslo"
            autocomplete="current-password"
            inputmode="text"
            aria-label="Heslo pro přístup"
            aria-required="true"
            required
          />

          <label class="introR-access-checkbox" for="introR-show-password-toggle">
            <input id="introR-show-password-toggle" type="checkbox" aria-label="Zobrazit heslo při psaní" />
            Zobrazit heslo
          </label>

          <button id="introR-access-submit" class="introR-access-button" type="submit" aria-label="Otevřít přístup ke kurzu">
            Otevřít
          </button>

          <p id="introR-access-error" class="introR-access-error" aria-live="polite" aria-atomic="true"></p>
        </form>

        <div class="introR-access-contact">
          V případě komplikací mě kontaktujte na
          <a href="mailto:lucie.hoskova@ruk.cuni.cz" aria-label="Napište e-mail na Lucii Hoskova">
            lucie.hoskova@ruk.cuni.cz
          </a>
        </div>
      </div>
    `;

    body.style.overflow = "hidden";
    body.appendChild(overlay);

    const passwordInput = document.getElementById("introR-access-password");
    const toggleCheckbox = document.getElementById("introR-show-password-toggle");
    const submitButton = document.getElementById("introR-access-submit");
    const errorText = document.getElementById("introR-access-error");
    const form = overlay.querySelector(".introR-access-form");

    toggleCheckbox.addEventListener("change", function () {
      passwordInput.type = toggleCheckbox.checked ? "text" : "password";
      passwordInput.setAttribute("aria-label", toggleCheckbox.checked ? "Heslo pro přístup, aktuálně zobrazené" : "Heslo pro přístup");
    });

    function attemptAccess(event) {
      if (event) {
        event.preventDefault();
      }

      const entered = passwordInput.value;

      if (entered === password) {
        sessionStorage.setItem(sessionKey, "granted");
        overlay.remove();
        body.style.overflow = "";
        return;
      }

      errorText.textContent = "Nesprávné heslo. Zkuste to znovu.";
      passwordInput.value = "";
      passwordInput.setAttribute("aria-invalid", "true");
      passwordInput.focus();
    }

    submitButton.addEventListener("click", attemptAccess);
    form.addEventListener("submit", attemptAccess);
    passwordInput.addEventListener("keydown", function (event) {
      if (event.key === "Enter") {
        attemptAccess(event);
      }
    });
    passwordInput.addEventListener("input", function () {
      passwordInput.setAttribute("aria-invalid", "false");
      if (errorText.textContent) {
        errorText.textContent = "";
      }
    });

    return overlay;
  }

  createLoginOverlay();
});