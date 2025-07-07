export const idlFactory = ({ IDL }) => {
  const Member = IDL.Record({ 'age' : IDL.Nat, 'name' : IDL.Text });
  const Result = IDL.Variant({ 'ok' : IDL.Null, 'err' : IDL.Text });
  const Result_1 = IDL.Variant({ 'ok' : Member, 'err' : IDL.Text });
  return IDL.Service({
    'addMember' : IDL.Func([IDL.Principal, Member], [Result], []),
    'getAllMembers' : IDL.Func([], [IDL.Vec(Member)], ['query']),
    'getAllMembersWithPrincipals' : IDL.Func(
        [],
        [IDL.Vec(IDL.Tuple(IDL.Principal, Member))],
        ['query'],
      ),
    'getMember' : IDL.Func([IDL.Principal], [Result_1], ['query']),
    'numberOfMembers' : IDL.Func([], [IDL.Nat], ['query']),
    'removeMember' : IDL.Func([IDL.Principal], [Result], []),
    'updateMember' : IDL.Func([IDL.Principal, Member], [Result], []),
  });
};
export const init = ({ IDL }) => { return []; };
