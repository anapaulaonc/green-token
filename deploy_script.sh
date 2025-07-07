#!/bin/bash

# Configurar variáveis
export MINTER=$(dfx identity get-principal)
export DEFAULT=$(dfx identity get-principal)

echo "Minter: $MINTER"
echo "Default: $DEFAULT"

# Deploy da ledger ICRC-1
dfx deploy icrc1_ledger_canister --argument "(variant { Init = record {
     token_symbol = \"GT\";
     token_name = \"Green Token\";
     minting_account = record { owner = principal \"$MINTER\" };
     transfer_fee = 10_000;
     metadata = vec {};
     initial_balances = vec { 
         record { 
             record { owner = principal \"$DEFAULT\" }; 
             10_000_000_000; 
         }; 
     };
     archive_options = record {
         num_blocks_to_archive = 1000;
         trigger_threshold = 2000;
         controller_id = principal \"$MINTER\";
     };
     feature_flags = opt record {
         icrc2 = true;
     };
 }
})"

echo "Token ICRC-1 deployed successfully!"
echo "Your balance should be 10,000,000,000 GT tokens"