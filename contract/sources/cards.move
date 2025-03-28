module cyberfrog::cards;

use std::string::{String,Self};
use sui::{
    table::{Self, Table},
    event::{emit},
    };
//====Structs===//
public struct CardMetadata has store, copy, drop {
    name: String,
    expire_time: u64,
    defend: u64,
    attack: u64,
    description: String,
}

public struct Card has key, store{
    id: UID,
    metadata: CardMetadata,
}

//Events
public struct CardCreated has copy, drop {
    id:ID,
    cardName: String
}
//====Functions===//
public fun create_card(
    name: String,
    expire_time: u64,
    defend: u64,
    attack: u64,
    description: String,
    ctx: &mut TxContext
): Card {

    let metadata = CardMetadata {
        name,
        expire_time,
        defend,
        attack,
        description,
    };

    let card = Card {
        id: object::new(ctx),
        metadata,
    };
    
    let card_id = card.id.to_inner();
    emit (CardCreated {
        id: card_id,
        cardName: name
    });
    card
}

public fun get_card_name(card: &Card): String {
    card.metadata.name
}

public fun get_card_expire_time(card: &Card): u64 {
    card.metadata.expire_time
}
public fun get_card_defend(card: &Card): u64 {
    card.metadata.defend
}
public fun get_card_attack(card: &Card): u64 {
    card.metadata.attack
}
public fun get_card_description(card: &Card): String {
    card.metadata.description
}

