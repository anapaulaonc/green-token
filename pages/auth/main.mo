import Result "mo:base/Result";
import HashMap "mo:base/HashMap";
import Principal "mo:base/Principal";
import Iter "mo:base/Iter";
import Types "types";

actor {
    type Member = Types.Member;
    type Result<Ok, Err> = Types.Result<Ok, Err>;
    type HashMap<K, V> = Types.HashMap<K, V>;

    // HashMap para armazenar membros usando Principal como chave
    let members = HashMap.HashMap<Principal, Member>(0, Principal.equal, Principal.hash);

    // Adiciona um novo membro usando principal do membro em vez do caller
    public shared ({ caller }) func addMember(memberPrincipal: Principal, member : Member) : async Result<(), Text> {
        switch (members.get(memberPrincipal)) {
            case (null) {
                members.put(memberPrincipal, member);
                return #ok();
            };
            case (?existingMember) {
                return #err("Membro com este Principal já existe");
            };
        };
    };

    // Atualiza um membro existente
    public shared ({ caller }) func updateMember(memberPrincipal: Principal, newMember : Member) : async Result<(), Text> {
        // Verifique se o caller tem permissão para atualizar (opcional)
        switch (members.get(memberPrincipal)) {
            case (null) {
                return #err("Membro não existe");
            };
            case (?member) {
                members.put(memberPrincipal, newMember);
                return #ok();
            };
        };
    };

    // Remove um membro
    public shared ({ caller }) func removeMember(memberPrincipal: Principal) : async Result<(), Text> {
        // Verifique se o caller tem permissão para remover (opcional)
        switch (members.get(memberPrincipal)) {
            case (null) {
                return #err("Membro não existe");
            };
            case (?member) {
                members.delete(memberPrincipal);
                return #ok();
            };
        };
    };

    // Obter informações de um membro específico
    public query func getMember(p : Principal) : async Result<Member, Text> {
        switch (members.get(p)) {
            case (null) {
                return #err("Membro não existe");
            };
            case (?member) {
                return #ok(member);
            };
        };
    };

    // Obter todos os membros
    public query func getAllMembers() : async [Member] {
        return Iter.toArray(members.vals());
    };

    // Obter número de membros
    public query func numberOfMembers() : async Nat {
        return members.size();
    };

    // Obter todos os membros com seus principais
    public query func getAllMembersWithPrincipals() : async [(Principal, Member)] {
        return Iter.toArray(members.entries());
    };
}