
# Dokumentacja projektu: WSEI DevOps Project CI

## Instrukcja uruchamiania aplikacji

1. **Zainstaluj wymagane oprogramowanie**:
   - Docker
   - Python3
   
2. **Klonowanie repozytorium**:
   ```bash
   git clone <URL_REPOZYTORIUM>
   cd <NAZWA_REPOZYTORIUM>
   ```

3. **Uruchomienie aplikacji lokalnie**:
   - W środowisku lokalnym:
     ```bash
     python app.py
     ```
   - W kontenerze Docker:
     ```bash
     docker build -t devops-app .
     docker run -p 8080:8080 devops-app
     ```

4. **Testowanie aplikacji**:
   - Aplikacja jest dostępna pod adresem [http://localhost:8080](http://localhost:8080)
   - Wywołaj endpoint `/` lub `/imie` np.:
     ```bash
     curl http://localhost:8080
     curl http://localhost:8080/pawel
     ```

## Proces CI

### Konfiguracja GitHub Actions:

Plik `.github/workflows/ci.yml` zawiera konfigurację procesu CI

### Etapy CI:

1. **Checkout repozytorium**
   - Pobiera kod źródłowy z repozytorium.

2. **Logowanie do GitHub Container Registry**
   - Uwierzytelnia użytkownika w celu publikacji obrazu Docker.

3. **Budowanie obrazu Docker**
   - Tworzy obraz Dockera z pliku `Dockerfile`.

4. **Skanowanie bezpieczeństwa**
   - Wykorzystuje narzędzie Trivy do analizy obrazu pod kątem krytycznych podatności.

5. **Testowanie aplikacji**
   - W tym kroku wykonywany jest echo, nie są przeprowadzane testy. Aby przeprowadzić testy należy wprowadzić je w miejscu kroku Test

6. **Publikacja obrazu Docker**
   - Wysyła obraz do GitHub Container Registry.

