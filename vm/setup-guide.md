# Kicksecure host
- Procure a debian netinst image
- Boot into it, make sur to not create a separate root password (just click enter, leaving the password blank)
- After rebooting, `sudo apt autoremove --purge` to remove unused packages that were installed only as dependencies and are now orphaned and `sudo systemctl purge SERVICE` to all the services you're sure you don't need, but by default on the netinst image you won't have to slim down anything
- The do the following:
```bash
# 1. Install necessary tools (if not already there)
sudo apt install --no-install-recommends curl gpg

# 2. Download and place the signing key
sudo curl --tlsv1.3 --output /usr/share/keyrings/derivative.asc --url https://www.kicksecure.com/keys/derivative.asc

# 3. Add the APT Repository using your Debian codename (assuming bookworm)
# NOTE: Replace 'bookworm' if you're on a newer release like 'trixie'
echo "deb [signed-by=/usr/share/keyrings/derivative.asc] https://deb.kicksecure.com bookworm main" | sudo tee /etc/apt/sources.list.d/kicksecure.list

# 4. Update and Install (The successful part)
sudo apt update
sudo apt install kicksecure-general-cli
```
- 
