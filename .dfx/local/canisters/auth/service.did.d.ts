import type { Principal } from '@dfinity/principal';
import type { ActorMethod } from '@dfinity/agent';
import type { IDL } from '@dfinity/candid';

export interface Member { 'age' : bigint, 'name' : string }
export type Result = { 'ok' : null } |
  { 'err' : string };
export type Result_1 = { 'ok' : Member } |
  { 'err' : string };
export interface _SERVICE {
  'addMember' : ActorMethod<[Principal, Member], Result>,
  'getAllMembers' : ActorMethod<[], Array<Member>>,
  'getAllMembersWithPrincipals' : ActorMethod<[], Array<[Principal, Member]>>,
  'getMember' : ActorMethod<[Principal], Result_1>,
  'numberOfMembers' : ActorMethod<[], bigint>,
  'removeMember' : ActorMethod<[Principal], Result>,
  'updateMember' : ActorMethod<[Principal, Member], Result>,
}
export declare const idlFactory: IDL.InterfaceFactory;
export declare const init: (args: { IDL: typeof IDL }) => IDL.Type[];
