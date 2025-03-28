module cyberfrog::config;

    /// 游戏配置结构
    public struct GameConfig has key, store {
        id: UID,
        // token 相关配置
        tadpole_amount_daily_claim: u64,
        //卡组相关配置
        max_cards_deck: u64,
        min_cards_deck: u64
    }


    /// 创建默认配置
    public(package) fun create_config(ctx: &mut TxContext): GameConfig {
        GameConfig {
            id: object::new(ctx),
            // token 相关配置
            tadpole_amount_daily_claim: 50,
            //卡组相关配置
            max_cards_deck: 5,
            min_cards_deck: 3,
        }
    }

    /// 获取
   public fun get_tadpole_amount_daily_claim(config: &GameConfig): u64 {
        config.tadpole_amount_daily_claim
    }
    public fun get_max_cards_deck(config: &GameConfig): u64 {
        config.max_cards_deck
    }
    public fun get_min_cards_deck(config: &GameConfig): u64 {
        config.min_cards_deck
    }

    /// 设置
   public fun set_tadpole_amount_daily_claim(config: &mut GameConfig, amount: u64) {
        config.tadpole_amount_daily_claim = amount;
    }
    public fun set_max_cards_deck(config: &mut GameConfig, amount: u64) {
        config.max_cards_deck = amount;
    }
    public fun set_min_cards_deck(config: &mut GameConfig, amount: u64) {
        config.min_cards_deck = amount;
    }