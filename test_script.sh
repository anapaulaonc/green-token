#!/bin/bash

# Configurar variáveis
export MINTER=$(dfx identity get-principal)
export DEFAULT=$(dfx identity get-principal)

echo "=== TESTANDO TOKEN ICRC-1 ==="
echo "Principal: $DEFAULT"
echo ""

# 1. Verificar metadados
echo "1. Verificando metadados..."
dfx canister call icrc1_ledger_canister icrc1_metadata '()'
echo ""

# 2. Verificar saldo inicial
echo "2. Verificando saldo inicial..."
dfx canister call icrc1_ledger_canister icrc1_balance_of "(record { owner = principal \"$DEFAULT\"; })"
echo ""

# 3. Verificar nome e símbolo
echo "3. Verificando nome e símbolo..."
dfx canister call icrc1_ledger_canister icrc1_name '()'
dfx canister call icrc1_ledger_canister icrc1_symbol '()'
echo ""

# 4. Verificar decimais
echo "4. Verificando decimais..."
dfx canister call icrc1_ledger_canister icrc1_decimals '()'
echo ""

# 5. Verificar fee
echo "5. Verificando taxa de transferência..."
dfx canister call icrc1_ledger_canister icrc1_fee '()'
echo ""

# 6. Verificar total supply
echo "6. Verificando supply total..."
dfx canister call icrc1_ledger_canister icrc1_total_supply '()'
echo ""

echo "=== TESTE CONCLUÍDO ==="