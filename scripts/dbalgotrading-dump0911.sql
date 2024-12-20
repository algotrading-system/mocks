toc.dat                                                                                             0000600 0004000 0002000 00000227426 14713710064 0014457 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP           '        	    
    |            dbalgotrading    13.13    13.13 �               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                    0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                    0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                    1262    16384    dbalgotrading    DATABASE     a   CREATE DATABASE dbalgotrading WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';
    DROP DATABASE dbalgotrading;
                postgres    false         �            1259    17754    account    TABLE     �  CREATE TABLE public.account (
    id integer NOT NULL,
    number character varying NOT NULL,
    account_type character varying NOT NULL,
    currency character varying,
    initial_balance double precision,
    current_balance double precision,
    margin_available double precision,
    unrealized_pnl double precision,
    realized_pnl double precision,
    updated_at timestamp without time zone,
    created_by integer,
    created_at timestamp without time zone
);
    DROP TABLE public.account;
       public         heap    postgres    false         �            1259    17752    account_id_seq    SEQUENCE     �   CREATE SEQUENCE public.account_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.account_id_seq;
       public          postgres    false    212                    0    0    account_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.account_id_seq OWNED BY public.account.id;
          public          postgres    false    211         �            1259    26311    account_operation    TABLE        CREATE TABLE public.account_operation (
    id integer NOT NULL,
    account_id integer,
    broker_id integer,
    broker_name character varying,
    broker_acculated_pnl_amount double precision,
    broker_acculated_pnl_percentage integer,
    broker_acculated_pnl_currency character varying,
    broker_acculated_in_amount integer,
    broker_currency character varying,
    broker_asset_allocation_percentage integer,
    risk_profile_id integer,
    risk_profile_name character varying,
    risk_profile_acculated_pnl_amount double precision,
    risk_profile_acculated_pnl_percentage integer,
    risk_profile_acculated_pnl_currency character varying,
    risk_profile_acculated_in_amount integer,
    risk_profile_currency character varying,
    risk_profile_asset_allocation_percentage integer,
    group_id integer,
    group_name character varying,
    group_acculated_pnl_amount double precision,
    group_acculated_pnl_percentage integer,
    group_acculated_pnl_currency character varying,
    group_acculated_in_amount integer,
    group_currency character varying,
    group_asset_allocation_percentage integer,
    strategy_id integer,
    strategy_name character varying,
    strategy_acculated_pnl_amount double precision,
    strategy_acculated_pnl_percentage integer,
    strategy_acculated_pnl_currency character varying,
    strategy_acculated_in_amount integer,
    strategy_currency character varying,
    strategy_asset_allocation_percentage integer,
    created_at timestamp without time zone,
    "timestamp" timestamp without time zone
);
 %   DROP TABLE public.account_operation;
       public         heap    postgres    false         �            1259    26309    account_operation_id_seq    SEQUENCE     �   CREATE SEQUENCE public.account_operation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.account_operation_id_seq;
       public          postgres    false    250                    0    0    account_operation_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.account_operation_id_seq OWNED BY public.account_operation.id;
          public          postgres    false    249         �            1259    17867    account_strategy_position    TABLE     D  CREATE TABLE public.account_strategy_position (
    id integer NOT NULL,
    account_id integer,
    strategy_id integer,
    symbol character varying,
    contract_symbol integer,
    currency character varying,
    "position" character varying,
    average_cost character varying,
    additional_info character varying
);
 -   DROP TABLE public.account_strategy_position;
       public         heap    postgres    false         �            1259    17865     account_strategy_position_id_seq    SEQUENCE     �   CREATE SEQUENCE public.account_strategy_position_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.account_strategy_position_id_seq;
       public          postgres    false    226                    0    0     account_strategy_position_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.account_strategy_position_id_seq OWNED BY public.account_strategy_position.id;
          public          postgres    false    225         �            1259    17888    account_summary    TABLE     �  CREATE TABLE public.account_summary (
    id integer NOT NULL,
    account_id integer,
    account_type character varying,
    net_liquidation numeric,
    total_cash_value numeric,
    settled_cash numeric,
    accrued_cash numeric,
    buying_power numeric,
    gross_position_value numeric,
    available_funds numeric,
    full_maint_margin_req numeric,
    full_available_funds numeric,
    created_at timestamp without time zone
);
 #   DROP TABLE public.account_summary;
       public         heap    postgres    false         �            1259    17886    account_summary_id_seq    SEQUENCE     �   CREATE SEQUENCE public.account_summary_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.account_summary_id_seq;
       public          postgres    false    228                    0    0    account_summary_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.account_summary_id_seq OWNED BY public.account_summary.id;
          public          postgres    false    227         �            1259    17904    account_value    TABLE       CREATE TABLE public.account_value (
    id integer NOT NULL,
    account_id integer,
    cash_balance numeric,
    realized_pnl numeric,
    unrealized_pnl numeric,
    market_value numeric,
    currency character varying,
    created_at timestamp without time zone
);
 !   DROP TABLE public.account_value;
       public         heap    postgres    false         �            1259    17902    account_value_id_seq    SEQUENCE     �   CREATE SEQUENCE public.account_value_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.account_value_id_seq;
       public          postgres    false    230                    0    0    account_value_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.account_value_id_seq OWNED BY public.account_value.id;
          public          postgres    false    229         �            1259    17770    action_change    TABLE     �  CREATE TABLE public.action_change (
    id integer NOT NULL,
    name character varying,
    ticker character varying,
    exchange character varying,
    country_code character varying,
    type_value character varying,
    currency character varying,
    isin character varying,
    is_active boolean,
    created_by integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
 !   DROP TABLE public.action_change;
       public         heap    postgres    false         �            1259    17768    action_change_id_seq    SEQUENCE     �   CREATE SEQUENCE public.action_change_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.action_change_id_seq;
       public          postgres    false    214                    0    0    action_change_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.action_change_id_seq OWNED BY public.action_change.id;
          public          postgres    false    213         �            1259    17691    alembic_version    TABLE     X   CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);
 #   DROP TABLE public.alembic_version;
       public         heap    postgres    false         �            1259    17702    asset_manager_risk_profile    TABLE     �   CREATE TABLE public.asset_manager_risk_profile (
    id integer NOT NULL,
    asset_manager_id integer,
    risk_profile_id integer
);
 .   DROP TABLE public.asset_manager_risk_profile;
       public         heap    postgres    false         �            1259    17700 !   asset_manager_risk_profile_id_seq    SEQUENCE     �   CREATE SEQUENCE public.asset_manager_risk_profile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.asset_manager_risk_profile_id_seq;
       public          postgres    false    202                    0    0 !   asset_manager_risk_profile_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.asset_manager_risk_profile_id_seq OWNED BY public.asset_manager_risk_profile.id;
          public          postgres    false    201         �            1259    17786    at_group    TABLE     �  CREATE TABLE public.at_group (
    id integer NOT NULL,
    uuid character varying,
    name character varying NOT NULL,
    description character varying,
    image_url character varying,
    performance text,
    symbol_distribution text,
    symbol text,
    strategies_composition text,
    strategy_distribution text,
    created_by integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
    DROP TABLE public.at_group;
       public         heap    postgres    false         �            1259    17784    at_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.at_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.at_group_id_seq;
       public          postgres    false    216                    0    0    at_group_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.at_group_id_seq OWNED BY public.at_group.id;
          public          postgres    false    215         �            1259    17710    broker    TABLE     �   CREATE TABLE public.broker (
    id integer NOT NULL,
    name character varying,
    country character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
    DROP TABLE public.broker;
       public         heap    postgres    false         �            1259    17708    broker_id_seq    SEQUENCE     �   CREATE SEQUENCE public.broker_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.broker_id_seq;
       public          postgres    false    204                    0    0    broker_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.broker_id_seq OWNED BY public.broker.id;
          public          postgres    false    203         �            1259    18008 	   error_log    TABLE     �  CREATE TABLE public.error_log (
    id integer NOT NULL,
    account_id integer,
    broker_id integer,
    broker_group_id integer,
    risk_profile_id integer,
    strategy_id integer,
    order_id integer,
    error_message character varying,
    error_datetime timestamp without time zone,
    quantity integer,
    amount numeric,
    currency character varying,
    position_type character varying,
    asset_allocation character varying,
    error_type character varying,
    current_condition character varying,
    set_condition character varying,
    gap character varying,
    "timestamp" timestamp without time zone,
    contract_symbol character varying
);
    DROP TABLE public.error_log;
       public         heap    postgres    false         �            1259    18006    error_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.error_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.error_log_id_seq;
       public          postgres    false    242                    0    0    error_log_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.error_log_id_seq OWNED BY public.error_log.id;
          public          postgres    false    241         �            1259    17721    exchange    TABLE     �   CREATE TABLE public.exchange (
    id integer NOT NULL,
    name character varying,
    open_from timestamp without time zone,
    open_until timestamp without time zone,
    country_code character varying,
    symbol character varying
);
    DROP TABLE public.exchange;
       public         heap    postgres    false         �            1259    17719    exchange_id_seq    SEQUENCE     �   CREATE SEQUENCE public.exchange_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.exchange_id_seq;
       public          postgres    false    206                    0    0    exchange_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.exchange_id_seq OWNED BY public.exchange.id;
          public          postgres    false    205         �            1259    17920    group_risk_profile    TABLE     w   CREATE TABLE public.group_risk_profile (
    id integer NOT NULL,
    group_id integer,
    risk_profile_id integer
);
 &   DROP TABLE public.group_risk_profile;
       public         heap    postgres    false         �            1259    17918    group_risk_profile_id_seq    SEQUENCE     �   CREATE SEQUENCE public.group_risk_profile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.group_risk_profile_id_seq;
       public          postgres    false    232                    0    0    group_risk_profile_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.group_risk_profile_id_seq OWNED BY public.group_risk_profile.id;
          public          postgres    false    231         �            1259    18049    order_fills    TABLE     �   CREATE TABLE public.order_fills (
    id integer NOT NULL,
    order_id integer,
    execution_id character varying,
    contract_id character varying,
    commission double precision,
    currency character varying,
    released_pnl double precision
);
    DROP TABLE public.order_fills;
       public         heap    postgres    false         �            1259    18047    order_fills_id_seq    SEQUENCE     �   CREATE SEQUENCE public.order_fills_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.order_fills_id_seq;
       public          postgres    false    244                    0    0    order_fills_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.order_fills_id_seq OWNED BY public.order_fills.id;
          public          postgres    false    243         �            1259    18065 	   order_log    TABLE       CREATE TABLE public.order_log (
    id integer NOT NULL,
    broker_id integer,
    broker_name character varying NOT NULL,
    profile_id integer,
    profile_name character varying NOT NULL,
    group_id integer,
    group_name character varying NOT NULL,
    strategy_id integer,
    strategy_name character varying NOT NULL,
    account_number character varying NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    contract_symbol character varying NOT NULL,
    contract_id integer NOT NULL,
    action character varying NOT NULL,
    quantity integer NOT NULL,
    order_type character varying NOT NULL,
    stop_price double precision,
    order_status character varying NOT NULL,
    filled integer NOT NULL,
    remaining integer NOT NULL,
    avg_fill_price double precision NOT NULL,
    currency character varying NOT NULL,
    exchange character varying NOT NULL,
    order_id integer,
    perm_id integer NOT NULL,
    total_commissions double precision NOT NULL,
    commission_currency character varying NOT NULL,
    net_trade_pnl integer,
    lag_time timestamp without time zone NOT NULL,
    created_at timestamp without time zone NOT NULL,
    order_parent_id integer,
    parent_perm_id integer,
    is_open_position boolean,
    direction_trade character varying
);
    DROP TABLE public.order_log;
       public         heap    postgres    false         �            1259    18063    order_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.order_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.order_log_id_seq;
       public          postgres    false    246                     0    0    order_log_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.order_log_id_seq OWNED BY public.order_log.id;
          public          postgres    false    245         �            1259    17938    order_order    TABLE       CREATE TABLE public.order_order (
    id integer NOT NULL,
    account_id integer,
    account_number character varying,
    parent_id integer,
    parent_perm_id integer,
    perm_id integer,
    exchange character varying,
    currency character varying,
    contract_id character varying,
    action character varying,
    order_id character varying,
    symbol character varying,
    order_type character varying,
    price double precision,
    quantity integer,
    status character varying,
    lmt_price double precision,
    aux_price double precision,
    tif character varying,
    filled integer,
    avg_fill_price integer,
    created_at timestamp without time zone,
    update_at timestamp without time zone,
    "timestamp" timestamp without time zone
);
    DROP TABLE public.order_order;
       public         heap    postgres    false         �            1259    17936    order_order_id_seq    SEQUENCE     �   CREATE SEQUENCE public.order_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.order_order_id_seq;
       public          postgres    false    234         !           0    0    order_order_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.order_order_id_seq OWNED BY public.order_order.id;
          public          postgres    false    233         �            1259    17804    risk_profile    TABLE     a  CREATE TABLE public.risk_profile (
    id integer NOT NULL,
    uuid character varying,
    name character varying NOT NULL,
    description character varying,
    min_score numeric,
    max_score numeric,
    image_url character varying,
    created_by integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
     DROP TABLE public.risk_profile;
       public         heap    postgres    false         �            1259    17802    risk_profile_id_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_profile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.risk_profile_id_seq;
       public          postgres    false    218         "           0    0    risk_profile_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.risk_profile_id_seq OWNED BY public.risk_profile.id;
          public          postgres    false    217         �            1259    18101    signals    TABLE     �   CREATE TABLE public.signals (
    id integer NOT NULL,
    order_id integer,
    symbol character varying,
    signal_type character varying,
    strategy character varying,
    "timestamp" timestamp without time zone
);
    DROP TABLE public.signals;
       public         heap    postgres    false         �            1259    18099    signals_id_seq    SEQUENCE     �   CREATE SEQUENCE public.signals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.signals_id_seq;
       public          postgres    false    248         #           0    0    signals_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.signals_id_seq OWNED BY public.signals.id;
          public          postgres    false    247         �            1259    17822    strategy    TABLE     9  CREATE TABLE public.strategy (
    id integer NOT NULL,
    name character varying,
    is_active boolean,
    exchange_id integer,
    strategy_param_id integer,
    arn_location character varying,
    created_by integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
    DROP TABLE public.strategy;
       public         heap    postgres    false         �            1259    17838    strategy_allocation    TABLE     �   CREATE TABLE public.strategy_allocation (
    id integer NOT NULL,
    asset_allocation double precision,
    created_by integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
 '   DROP TABLE public.strategy_allocation;
       public         heap    postgres    false         �            1259    17836    strategy_allocation_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strategy_allocation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.strategy_allocation_id_seq;
       public          postgres    false    222         $           0    0    strategy_allocation_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.strategy_allocation_id_seq OWNED BY public.strategy_allocation.id;
          public          postgres    false    221         �            1259    17820    strategy_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strategy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.strategy_id_seq;
       public          postgres    false    220         %           0    0    strategy_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.strategy_id_seq OWNED BY public.strategy.id;
          public          postgres    false    219         �            1259    17732    strategy_params    TABLE     ]   CREATE TABLE public.strategy_params (
    id integer NOT NULL,
    operational_hours text
);
 #   DROP TABLE public.strategy_params;
       public         heap    postgres    false         �            1259    17730    strategy_params_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strategy_params_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.strategy_params_id_seq;
       public          postgres    false    208         &           0    0    strategy_params_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.strategy_params_id_seq OWNED BY public.strategy_params.id;
          public          postgres    false    207         �            1259    17954    strategy_strategy_allocation    TABLE     �   CREATE TABLE public.strategy_strategy_allocation (
    id integer NOT NULL,
    strategy_id integer,
    strategy_allocation_id integer
);
 0   DROP TABLE public.strategy_strategy_allocation;
       public         heap    postgres    false         �            1259    17952 #   strategy_strategy_allocation_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strategy_strategy_allocation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.strategy_strategy_allocation_id_seq;
       public          postgres    false    236         '           0    0 #   strategy_strategy_allocation_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.strategy_strategy_allocation_id_seq OWNED BY public.strategy_strategy_allocation.id;
          public          postgres    false    235         �            1259    17851    symbol    TABLE     �  CREATE TABLE public.symbol (
    id integer NOT NULL,
    name character varying NOT NULL,
    ticker character varying,
    exchange character varying,
    country_code character varying,
    type_value character varying,
    currency character varying,
    isin character varying,
    is_active boolean,
    created_by integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
    DROP TABLE public.symbol;
       public         heap    postgres    false         �            1259    17972    symbol_action_change    TABLE     {   CREATE TABLE public.symbol_action_change (
    id integer NOT NULL,
    symbol_id integer,
    action_change_id integer
);
 (   DROP TABLE public.symbol_action_change;
       public         heap    postgres    false         �            1259    17970    symbol_action_change_id_seq    SEQUENCE     �   CREATE SEQUENCE public.symbol_action_change_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.symbol_action_change_id_seq;
       public          postgres    false    238         (           0    0    symbol_action_change_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.symbol_action_change_id_seq OWNED BY public.symbol_action_change.id;
          public          postgres    false    237         �            1259    17849    symbol_id_seq    SEQUENCE     �   CREATE SEQUENCE public.symbol_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.symbol_id_seq;
       public          postgres    false    224         )           0    0    symbol_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.symbol_id_seq OWNED BY public.symbol.id;
          public          postgres    false    223         �            1259    17743    user    TABLE     �   CREATE TABLE public."user" (
    id integer NOT NULL,
    name character varying,
    email character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
    DROP TABLE public."user";
       public         heap    postgres    false         �            1259    17741    user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_id_seq;
       public          postgres    false    210         *           0    0    user_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;
          public          postgres    false    209         �            1259    17990    user_risk_profile    TABLE     u   CREATE TABLE public.user_risk_profile (
    id integer NOT NULL,
    user_id integer,
    risk_profile_id integer
);
 %   DROP TABLE public.user_risk_profile;
       public         heap    postgres    false         �            1259    17988    user_risk_profile_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_risk_profile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.user_risk_profile_id_seq;
       public          postgres    false    240         +           0    0    user_risk_profile_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.user_risk_profile_id_seq OWNED BY public.user_risk_profile.id;
          public          postgres    false    239         �           2604    17757 
   account id    DEFAULT     h   ALTER TABLE ONLY public.account ALTER COLUMN id SET DEFAULT nextval('public.account_id_seq'::regclass);
 9   ALTER TABLE public.account ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    211    212         �           2604    26314    account_operation id    DEFAULT     |   ALTER TABLE ONLY public.account_operation ALTER COLUMN id SET DEFAULT nextval('public.account_operation_id_seq'::regclass);
 C   ALTER TABLE public.account_operation ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    249    250    250         �           2604    17870    account_strategy_position id    DEFAULT     �   ALTER TABLE ONLY public.account_strategy_position ALTER COLUMN id SET DEFAULT nextval('public.account_strategy_position_id_seq'::regclass);
 K   ALTER TABLE public.account_strategy_position ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    225    226         �           2604    17891    account_summary id    DEFAULT     x   ALTER TABLE ONLY public.account_summary ALTER COLUMN id SET DEFAULT nextval('public.account_summary_id_seq'::regclass);
 A   ALTER TABLE public.account_summary ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    227    228         �           2604    17907    account_value id    DEFAULT     t   ALTER TABLE ONLY public.account_value ALTER COLUMN id SET DEFAULT nextval('public.account_value_id_seq'::regclass);
 ?   ALTER TABLE public.account_value ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    230    229    230         �           2604    17773    action_change id    DEFAULT     t   ALTER TABLE ONLY public.action_change ALTER COLUMN id SET DEFAULT nextval('public.action_change_id_seq'::regclass);
 ?   ALTER TABLE public.action_change ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    214    214         �           2604    17705    asset_manager_risk_profile id    DEFAULT     �   ALTER TABLE ONLY public.asset_manager_risk_profile ALTER COLUMN id SET DEFAULT nextval('public.asset_manager_risk_profile_id_seq'::regclass);
 L   ALTER TABLE public.asset_manager_risk_profile ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    202    201    202         �           2604    17789    at_group id    DEFAULT     j   ALTER TABLE ONLY public.at_group ALTER COLUMN id SET DEFAULT nextval('public.at_group_id_seq'::regclass);
 :   ALTER TABLE public.at_group ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216         �           2604    17713 	   broker id    DEFAULT     f   ALTER TABLE ONLY public.broker ALTER COLUMN id SET DEFAULT nextval('public.broker_id_seq'::regclass);
 8   ALTER TABLE public.broker ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    204    203    204         �           2604    18011    error_log id    DEFAULT     l   ALTER TABLE ONLY public.error_log ALTER COLUMN id SET DEFAULT nextval('public.error_log_id_seq'::regclass);
 ;   ALTER TABLE public.error_log ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    242    241    242         �           2604    17724    exchange id    DEFAULT     j   ALTER TABLE ONLY public.exchange ALTER COLUMN id SET DEFAULT nextval('public.exchange_id_seq'::regclass);
 :   ALTER TABLE public.exchange ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    206    205    206         �           2604    17923    group_risk_profile id    DEFAULT     ~   ALTER TABLE ONLY public.group_risk_profile ALTER COLUMN id SET DEFAULT nextval('public.group_risk_profile_id_seq'::regclass);
 D   ALTER TABLE public.group_risk_profile ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    231    232    232         �           2604    18052    order_fills id    DEFAULT     p   ALTER TABLE ONLY public.order_fills ALTER COLUMN id SET DEFAULT nextval('public.order_fills_id_seq'::regclass);
 =   ALTER TABLE public.order_fills ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    244    243    244         �           2604    18068    order_log id    DEFAULT     l   ALTER TABLE ONLY public.order_log ALTER COLUMN id SET DEFAULT nextval('public.order_log_id_seq'::regclass);
 ;   ALTER TABLE public.order_log ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    245    246    246         �           2604    17941    order_order id    DEFAULT     p   ALTER TABLE ONLY public.order_order ALTER COLUMN id SET DEFAULT nextval('public.order_order_id_seq'::regclass);
 =   ALTER TABLE public.order_order ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    233    234    234         �           2604    17807    risk_profile id    DEFAULT     r   ALTER TABLE ONLY public.risk_profile ALTER COLUMN id SET DEFAULT nextval('public.risk_profile_id_seq'::regclass);
 >   ALTER TABLE public.risk_profile ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217    218         �           2604    18104 
   signals id    DEFAULT     h   ALTER TABLE ONLY public.signals ALTER COLUMN id SET DEFAULT nextval('public.signals_id_seq'::regclass);
 9   ALTER TABLE public.signals ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    248    247    248         �           2604    17825    strategy id    DEFAULT     j   ALTER TABLE ONLY public.strategy ALTER COLUMN id SET DEFAULT nextval('public.strategy_id_seq'::regclass);
 :   ALTER TABLE public.strategy ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219    220         �           2604    17841    strategy_allocation id    DEFAULT     �   ALTER TABLE ONLY public.strategy_allocation ALTER COLUMN id SET DEFAULT nextval('public.strategy_allocation_id_seq'::regclass);
 E   ALTER TABLE public.strategy_allocation ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    222    222         �           2604    17735    strategy_params id    DEFAULT     x   ALTER TABLE ONLY public.strategy_params ALTER COLUMN id SET DEFAULT nextval('public.strategy_params_id_seq'::regclass);
 A   ALTER TABLE public.strategy_params ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    207    208    208         �           2604    17957    strategy_strategy_allocation id    DEFAULT     �   ALTER TABLE ONLY public.strategy_strategy_allocation ALTER COLUMN id SET DEFAULT nextval('public.strategy_strategy_allocation_id_seq'::regclass);
 N   ALTER TABLE public.strategy_strategy_allocation ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    235    236    236         �           2604    17854 	   symbol id    DEFAULT     f   ALTER TABLE ONLY public.symbol ALTER COLUMN id SET DEFAULT nextval('public.symbol_id_seq'::regclass);
 8   ALTER TABLE public.symbol ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    223    224         �           2604    17975    symbol_action_change id    DEFAULT     �   ALTER TABLE ONLY public.symbol_action_change ALTER COLUMN id SET DEFAULT nextval('public.symbol_action_change_id_seq'::regclass);
 F   ALTER TABLE public.symbol_action_change ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    237    238    238         �           2604    17746    user id    DEFAULT     d   ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);
 8   ALTER TABLE public."user" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    210    210         �           2604    17993    user_risk_profile id    DEFAULT     |   ALTER TABLE ONLY public.user_risk_profile ALTER COLUMN id SET DEFAULT nextval('public.user_risk_profile_id_seq'::regclass);
 C   ALTER TABLE public.user_risk_profile ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    239    240    240         �          0    17754    account 
   TABLE DATA           �   COPY public.account (id, number, account_type, currency, initial_balance, current_balance, margin_available, unrealized_pnl, realized_pnl, updated_at, created_by, created_at) FROM stdin;
    public          postgres    false    212       3302.dat           0    26311    account_operation 
   TABLE DATA           �  COPY public.account_operation (id, account_id, broker_id, broker_name, broker_acculated_pnl_amount, broker_acculated_pnl_percentage, broker_acculated_pnl_currency, broker_acculated_in_amount, broker_currency, broker_asset_allocation_percentage, risk_profile_id, risk_profile_name, risk_profile_acculated_pnl_amount, risk_profile_acculated_pnl_percentage, risk_profile_acculated_pnl_currency, risk_profile_acculated_in_amount, risk_profile_currency, risk_profile_asset_allocation_percentage, group_id, group_name, group_acculated_pnl_amount, group_acculated_pnl_percentage, group_acculated_pnl_currency, group_acculated_in_amount, group_currency, group_asset_allocation_percentage, strategy_id, strategy_name, strategy_acculated_pnl_amount, strategy_acculated_pnl_percentage, strategy_acculated_pnl_currency, strategy_acculated_in_amount, strategy_currency, strategy_asset_allocation_percentage, created_at, "timestamp") FROM stdin;
    public          postgres    false    250       3340.dat �          0    17867    account_strategy_position 
   TABLE DATA           �   COPY public.account_strategy_position (id, account_id, strategy_id, symbol, contract_symbol, currency, "position", average_cost, additional_info) FROM stdin;
    public          postgres    false    226       3316.dat �          0    17888    account_summary 
   TABLE DATA           �   COPY public.account_summary (id, account_id, account_type, net_liquidation, total_cash_value, settled_cash, accrued_cash, buying_power, gross_position_value, available_funds, full_maint_margin_req, full_available_funds, created_at) FROM stdin;
    public          postgres    false    228       3318.dat �          0    17904    account_value 
   TABLE DATA           �   COPY public.account_value (id, account_id, cash_balance, realized_pnl, unrealized_pnl, market_value, currency, created_at) FROM stdin;
    public          postgres    false    230       3320.dat �          0    17770    action_change 
   TABLE DATA           �   COPY public.action_change (id, name, ticker, exchange, country_code, type_value, currency, isin, is_active, created_by, created_at, updated_at) FROM stdin;
    public          postgres    false    214       3304.dat �          0    17691    alembic_version 
   TABLE DATA           6   COPY public.alembic_version (version_num) FROM stdin;
    public          postgres    false    200       3290.dat �          0    17702    asset_manager_risk_profile 
   TABLE DATA           [   COPY public.asset_manager_risk_profile (id, asset_manager_id, risk_profile_id) FROM stdin;
    public          postgres    false    202       3292.dat �          0    17786    at_group 
   TABLE DATA           �   COPY public.at_group (id, uuid, name, description, image_url, performance, symbol_distribution, symbol, strategies_composition, strategy_distribution, created_by, created_at, updated_at) FROM stdin;
    public          postgres    false    216       3306.dat �          0    17710    broker 
   TABLE DATA           K   COPY public.broker (id, name, country, created_at, updated_at) FROM stdin;
    public          postgres    false    204       3294.dat           0    18008 	   error_log 
   TABLE DATA           $  COPY public.error_log (id, account_id, broker_id, broker_group_id, risk_profile_id, strategy_id, order_id, error_message, error_datetime, quantity, amount, currency, position_type, asset_allocation, error_type, current_condition, set_condition, gap, "timestamp", contract_symbol) FROM stdin;
    public          postgres    false    242       3332.dat �          0    17721    exchange 
   TABLE DATA           Y   COPY public.exchange (id, name, open_from, open_until, country_code, symbol) FROM stdin;
    public          postgres    false    206       3296.dat �          0    17920    group_risk_profile 
   TABLE DATA           K   COPY public.group_risk_profile (id, group_id, risk_profile_id) FROM stdin;
    public          postgres    false    232       3322.dat           0    18049    order_fills 
   TABLE DATA           r   COPY public.order_fills (id, order_id, execution_id, contract_id, commission, currency, released_pnl) FROM stdin;
    public          postgres    false    244       3334.dat           0    18065 	   order_log 
   TABLE DATA           �  COPY public.order_log (id, broker_id, broker_name, profile_id, profile_name, group_id, group_name, strategy_id, strategy_name, account_number, "timestamp", contract_symbol, contract_id, action, quantity, order_type, stop_price, order_status, filled, remaining, avg_fill_price, currency, exchange, order_id, perm_id, total_commissions, commission_currency, net_trade_pnl, lag_time, created_at, order_parent_id, parent_perm_id, is_open_position, direction_trade) FROM stdin;
    public          postgres    false    246       3336.dat �          0    17938    order_order 
   TABLE DATA              COPY public.order_order (id, account_id, account_number, parent_id, parent_perm_id, perm_id, exchange, currency, contract_id, action, order_id, symbol, order_type, price, quantity, status, lmt_price, aux_price, tif, filled, avg_fill_price, created_at, update_at, "timestamp") FROM stdin;
    public          postgres    false    234       3324.dat �          0    17804    risk_profile 
   TABLE DATA           �   COPY public.risk_profile (id, uuid, name, description, min_score, max_score, image_url, created_by, created_at, updated_at) FROM stdin;
    public          postgres    false    218       3308.dat 
          0    18101    signals 
   TABLE DATA           [   COPY public.signals (id, order_id, symbol, signal_type, strategy, "timestamp") FROM stdin;
    public          postgres    false    248       3338.dat �          0    17822    strategy 
   TABLE DATA           �   COPY public.strategy (id, name, is_active, exchange_id, strategy_param_id, arn_location, created_by, created_at, updated_at) FROM stdin;
    public          postgres    false    220       3310.dat �          0    17838    strategy_allocation 
   TABLE DATA           g   COPY public.strategy_allocation (id, asset_allocation, created_by, created_at, updated_at) FROM stdin;
    public          postgres    false    222       3312.dat �          0    17732    strategy_params 
   TABLE DATA           @   COPY public.strategy_params (id, operational_hours) FROM stdin;
    public          postgres    false    208       3298.dat �          0    17954    strategy_strategy_allocation 
   TABLE DATA           _   COPY public.strategy_strategy_allocation (id, strategy_id, strategy_allocation_id) FROM stdin;
    public          postgres    false    236       3326.dat �          0    17851    symbol 
   TABLE DATA           �   COPY public.symbol (id, name, ticker, exchange, country_code, type_value, currency, isin, is_active, created_by, created_at, updated_at) FROM stdin;
    public          postgres    false    224       3314.dat            0    17972    symbol_action_change 
   TABLE DATA           O   COPY public.symbol_action_change (id, symbol_id, action_change_id) FROM stdin;
    public          postgres    false    238       3328.dat �          0    17743    user 
   TABLE DATA           I   COPY public."user" (id, name, email, created_at, updated_at) FROM stdin;
    public          postgres    false    210       3300.dat           0    17990    user_risk_profile 
   TABLE DATA           I   COPY public.user_risk_profile (id, user_id, risk_profile_id) FROM stdin;
    public          postgres    false    240       3330.dat ,           0    0    account_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.account_id_seq', 1, false);
          public          postgres    false    211         -           0    0    account_operation_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.account_operation_id_seq', 1, false);
          public          postgres    false    249         .           0    0     account_strategy_position_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.account_strategy_position_id_seq', 1, false);
          public          postgres    false    225         /           0    0    account_summary_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.account_summary_id_seq', 1, false);
          public          postgres    false    227         0           0    0    account_value_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.account_value_id_seq', 1, false);
          public          postgres    false    229         1           0    0    action_change_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.action_change_id_seq', 1, false);
          public          postgres    false    213         2           0    0 !   asset_manager_risk_profile_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.asset_manager_risk_profile_id_seq', 1, false);
          public          postgres    false    201         3           0    0    at_group_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.at_group_id_seq', 1, false);
          public          postgres    false    215         4           0    0    broker_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.broker_id_seq', 1, false);
          public          postgres    false    203         5           0    0    error_log_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.error_log_id_seq', 1, false);
          public          postgres    false    241         6           0    0    exchange_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.exchange_id_seq', 1, false);
          public          postgres    false    205         7           0    0    group_risk_profile_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.group_risk_profile_id_seq', 1, false);
          public          postgres    false    231         8           0    0    order_fills_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.order_fills_id_seq', 1, false);
          public          postgres    false    243         9           0    0    order_log_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.order_log_id_seq', 1, false);
          public          postgres    false    245         :           0    0    order_order_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.order_order_id_seq', 1, false);
          public          postgres    false    233         ;           0    0    risk_profile_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.risk_profile_id_seq', 1, false);
          public          postgres    false    217         <           0    0    signals_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.signals_id_seq', 1, false);
          public          postgres    false    247         =           0    0    strategy_allocation_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.strategy_allocation_id_seq', 1, false);
          public          postgres    false    221         >           0    0    strategy_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.strategy_id_seq', 1, false);
          public          postgres    false    219         ?           0    0    strategy_params_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.strategy_params_id_seq', 1, false);
          public          postgres    false    207         @           0    0 #   strategy_strategy_allocation_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.strategy_strategy_allocation_id_seq', 1, false);
          public          postgres    false    235         A           0    0    symbol_action_change_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.symbol_action_change_id_seq', 1, false);
          public          postgres    false    237         B           0    0    symbol_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.symbol_id_seq', 1, false);
          public          postgres    false    223         C           0    0    user_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.user_id_seq', 1, false);
          public          postgres    false    209         D           0    0    user_risk_profile_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.user_risk_profile_id_seq', 1, false);
          public          postgres    false    239         0           2606    26319 (   account_operation account_operation_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.account_operation
    ADD CONSTRAINT account_operation_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.account_operation DROP CONSTRAINT account_operation_pkey;
       public            postgres    false    250                    2606    17762    account account_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.account DROP CONSTRAINT account_pkey;
       public            postgres    false    212                    2606    17875 8   account_strategy_position account_strategy_position_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.account_strategy_position
    ADD CONSTRAINT account_strategy_position_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.account_strategy_position DROP CONSTRAINT account_strategy_position_pkey;
       public            postgres    false    226                    2606    17896 $   account_summary account_summary_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.account_summary
    ADD CONSTRAINT account_summary_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.account_summary DROP CONSTRAINT account_summary_pkey;
       public            postgres    false    228                    2606    17912     account_value account_value_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.account_value
    ADD CONSTRAINT account_value_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.account_value DROP CONSTRAINT account_value_pkey;
       public            postgres    false    230                    2606    17778     action_change action_change_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.action_change
    ADD CONSTRAINT action_change_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.action_change DROP CONSTRAINT action_change_pkey;
       public            postgres    false    214         �           2606    17695 #   alembic_version alembic_version_pkc 
   CONSTRAINT     j   ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);
 M   ALTER TABLE ONLY public.alembic_version DROP CONSTRAINT alembic_version_pkc;
       public            postgres    false    200         �           2606    17707 :   asset_manager_risk_profile asset_manager_risk_profile_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.asset_manager_risk_profile
    ADD CONSTRAINT asset_manager_risk_profile_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.asset_manager_risk_profile DROP CONSTRAINT asset_manager_risk_profile_pkey;
       public            postgres    false    202         
           2606    17794    at_group at_group_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.at_group
    ADD CONSTRAINT at_group_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.at_group DROP CONSTRAINT at_group_pkey;
       public            postgres    false    216                    2606    17796    at_group at_group_uuid_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.at_group
    ADD CONSTRAINT at_group_uuid_key UNIQUE (uuid);
 D   ALTER TABLE ONLY public.at_group DROP CONSTRAINT at_group_uuid_key;
       public            postgres    false    216         �           2606    17718    broker broker_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.broker
    ADD CONSTRAINT broker_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.broker DROP CONSTRAINT broker_pkey;
       public            postgres    false    204         (           2606    18016    error_log error_log_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.error_log
    ADD CONSTRAINT error_log_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.error_log DROP CONSTRAINT error_log_pkey;
       public            postgres    false    242                     2606    17729    exchange exchange_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.exchange
    ADD CONSTRAINT exchange_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.exchange DROP CONSTRAINT exchange_pkey;
       public            postgres    false    206                    2606    17925 *   group_risk_profile group_risk_profile_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.group_risk_profile
    ADD CONSTRAINT group_risk_profile_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.group_risk_profile DROP CONSTRAINT group_risk_profile_pkey;
       public            postgres    false    232         *           2606    18057    order_fills order_fills_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.order_fills
    ADD CONSTRAINT order_fills_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.order_fills DROP CONSTRAINT order_fills_pkey;
       public            postgres    false    244         ,           2606    18073    order_log order_log_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.order_log
    ADD CONSTRAINT order_log_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.order_log DROP CONSTRAINT order_log_pkey;
       public            postgres    false    246                     2606    17946    order_order order_order_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.order_order
    ADD CONSTRAINT order_order_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.order_order DROP CONSTRAINT order_order_pkey;
       public            postgres    false    234                    2606    17812    risk_profile risk_profile_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.risk_profile
    ADD CONSTRAINT risk_profile_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.risk_profile DROP CONSTRAINT risk_profile_pkey;
       public            postgres    false    218                    2606    17814 "   risk_profile risk_profile_uuid_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.risk_profile
    ADD CONSTRAINT risk_profile_uuid_key UNIQUE (uuid);
 L   ALTER TABLE ONLY public.risk_profile DROP CONSTRAINT risk_profile_uuid_key;
       public            postgres    false    218         .           2606    18109    signals signals_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.signals
    ADD CONSTRAINT signals_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.signals DROP CONSTRAINT signals_pkey;
       public            postgres    false    248                    2606    17843 ,   strategy_allocation strategy_allocation_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.strategy_allocation
    ADD CONSTRAINT strategy_allocation_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.strategy_allocation DROP CONSTRAINT strategy_allocation_pkey;
       public            postgres    false    222                    2606    17740 $   strategy_params strategy_params_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.strategy_params
    ADD CONSTRAINT strategy_params_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.strategy_params DROP CONSTRAINT strategy_params_pkey;
       public            postgres    false    208                    2606    17830    strategy strategy_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.strategy
    ADD CONSTRAINT strategy_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.strategy DROP CONSTRAINT strategy_pkey;
       public            postgres    false    220         "           2606    17959 >   strategy_strategy_allocation strategy_strategy_allocation_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.strategy_strategy_allocation
    ADD CONSTRAINT strategy_strategy_allocation_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.strategy_strategy_allocation DROP CONSTRAINT strategy_strategy_allocation_pkey;
       public            postgres    false    236         $           2606    17977 .   symbol_action_change symbol_action_change_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.symbol_action_change
    ADD CONSTRAINT symbol_action_change_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.symbol_action_change DROP CONSTRAINT symbol_action_change_pkey;
       public            postgres    false    238                    2606    17859    symbol symbol_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.symbol
    ADD CONSTRAINT symbol_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.symbol DROP CONSTRAINT symbol_pkey;
       public            postgres    false    224                    2606    17751    user user_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public            postgres    false    210         &           2606    17995 (   user_risk_profile user_risk_profile_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.user_risk_profile
    ADD CONSTRAINT user_risk_profile_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.user_risk_profile DROP CONSTRAINT user_risk_profile_pkey;
       public            postgres    false    240         1           2606    17763    account account_created_by_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_created_by_fkey FOREIGN KEY (created_by) REFERENCES public."user"(id);
 I   ALTER TABLE ONLY public.account DROP CONSTRAINT account_created_by_fkey;
       public          postgres    false    212    210    3076         S           2606    26320 3   account_operation account_operation_account_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.account_operation
    ADD CONSTRAINT account_operation_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.account(id);
 ]   ALTER TABLE ONLY public.account_operation DROP CONSTRAINT account_operation_account_id_fkey;
       public          postgres    false    250    212    3078         T           2606    26325 2   account_operation account_operation_broker_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.account_operation
    ADD CONSTRAINT account_operation_broker_id_fkey FOREIGN KEY (broker_id) REFERENCES public.broker(id);
 \   ALTER TABLE ONLY public.account_operation DROP CONSTRAINT account_operation_broker_id_fkey;
       public          postgres    false    250    3070    204         U           2606    26330 1   account_operation account_operation_group_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.account_operation
    ADD CONSTRAINT account_operation_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.at_group(id);
 [   ALTER TABLE ONLY public.account_operation DROP CONSTRAINT account_operation_group_id_fkey;
       public          postgres    false    250    216    3082         V           2606    26335 8   account_operation account_operation_risk_profile_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.account_operation
    ADD CONSTRAINT account_operation_risk_profile_id_fkey FOREIGN KEY (risk_profile_id) REFERENCES public.risk_profile(id);
 b   ALTER TABLE ONLY public.account_operation DROP CONSTRAINT account_operation_risk_profile_id_fkey;
       public          postgres    false    250    218    3086         W           2606    26340 4   account_operation account_operation_strategy_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.account_operation
    ADD CONSTRAINT account_operation_strategy_id_fkey FOREIGN KEY (strategy_id) REFERENCES public.strategy(id);
 ^   ALTER TABLE ONLY public.account_operation DROP CONSTRAINT account_operation_strategy_id_fkey;
       public          postgres    false    3090    220    250         8           2606    17876 C   account_strategy_position account_strategy_position_account_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.account_strategy_position
    ADD CONSTRAINT account_strategy_position_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.account(id);
 m   ALTER TABLE ONLY public.account_strategy_position DROP CONSTRAINT account_strategy_position_account_id_fkey;
       public          postgres    false    226    3078    212         9           2606    17881 D   account_strategy_position account_strategy_position_strategy_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.account_strategy_position
    ADD CONSTRAINT account_strategy_position_strategy_id_fkey FOREIGN KEY (strategy_id) REFERENCES public.strategy(id);
 n   ALTER TABLE ONLY public.account_strategy_position DROP CONSTRAINT account_strategy_position_strategy_id_fkey;
       public          postgres    false    220    226    3090         :           2606    17897 /   account_summary account_summary_account_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.account_summary
    ADD CONSTRAINT account_summary_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.account(id);
 Y   ALTER TABLE ONLY public.account_summary DROP CONSTRAINT account_summary_account_id_fkey;
       public          postgres    false    228    3078    212         ;           2606    17913 +   account_value account_value_account_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.account_value
    ADD CONSTRAINT account_value_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.account(id);
 U   ALTER TABLE ONLY public.account_value DROP CONSTRAINT account_value_account_id_fkey;
       public          postgres    false    230    3078    212         2           2606    17779 +   action_change action_change_created_by_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.action_change
    ADD CONSTRAINT action_change_created_by_fkey FOREIGN KEY (created_by) REFERENCES public."user"(id);
 U   ALTER TABLE ONLY public.action_change DROP CONSTRAINT action_change_created_by_fkey;
       public          postgres    false    3076    214    210         3           2606    17797 !   at_group at_group_created_by_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.at_group
    ADD CONSTRAINT at_group_created_by_fkey FOREIGN KEY (created_by) REFERENCES public."user"(id);
 K   ALTER TABLE ONLY public.at_group DROP CONSTRAINT at_group_created_by_fkey;
       public          postgres    false    210    3076    216         E           2606    18017 #   error_log error_log_account_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.error_log
    ADD CONSTRAINT error_log_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.account(id);
 M   ALTER TABLE ONLY public.error_log DROP CONSTRAINT error_log_account_id_fkey;
       public          postgres    false    242    3078    212         F           2606    18022 (   error_log error_log_broker_group_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.error_log
    ADD CONSTRAINT error_log_broker_group_id_fkey FOREIGN KEY (broker_group_id) REFERENCES public.at_group(id);
 R   ALTER TABLE ONLY public.error_log DROP CONSTRAINT error_log_broker_group_id_fkey;
       public          postgres    false    242    3082    216         G           2606    18027 "   error_log error_log_broker_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.error_log
    ADD CONSTRAINT error_log_broker_id_fkey FOREIGN KEY (broker_id) REFERENCES public.broker(id);
 L   ALTER TABLE ONLY public.error_log DROP CONSTRAINT error_log_broker_id_fkey;
       public          postgres    false    3070    204    242         H           2606    18032 !   error_log error_log_order_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.error_log
    ADD CONSTRAINT error_log_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.order_order(id);
 K   ALTER TABLE ONLY public.error_log DROP CONSTRAINT error_log_order_id_fkey;
       public          postgres    false    242    234    3104         I           2606    18037 (   error_log error_log_risk_profile_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.error_log
    ADD CONSTRAINT error_log_risk_profile_id_fkey FOREIGN KEY (risk_profile_id) REFERENCES public.risk_profile(id);
 R   ALTER TABLE ONLY public.error_log DROP CONSTRAINT error_log_risk_profile_id_fkey;
       public          postgres    false    242    3086    218         J           2606    18042 $   error_log error_log_strategy_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.error_log
    ADD CONSTRAINT error_log_strategy_id_fkey FOREIGN KEY (strategy_id) REFERENCES public.strategy(id);
 N   ALTER TABLE ONLY public.error_log DROP CONSTRAINT error_log_strategy_id_fkey;
       public          postgres    false    220    3090    242         <           2606    17926 3   group_risk_profile group_risk_profile_group_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.group_risk_profile
    ADD CONSTRAINT group_risk_profile_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.at_group(id);
 ]   ALTER TABLE ONLY public.group_risk_profile DROP CONSTRAINT group_risk_profile_group_id_fkey;
       public          postgres    false    232    216    3082         =           2606    17931 :   group_risk_profile group_risk_profile_risk_profile_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.group_risk_profile
    ADD CONSTRAINT group_risk_profile_risk_profile_id_fkey FOREIGN KEY (risk_profile_id) REFERENCES public.risk_profile(id);
 d   ALTER TABLE ONLY public.group_risk_profile DROP CONSTRAINT group_risk_profile_risk_profile_id_fkey;
       public          postgres    false    3086    218    232         K           2606    18058 %   order_fills order_fills_order_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_fills
    ADD CONSTRAINT order_fills_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.order_order(id);
 O   ALTER TABLE ONLY public.order_fills DROP CONSTRAINT order_fills_order_id_fkey;
       public          postgres    false    244    3104    234         L           2606    18074 "   order_log order_log_broker_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_log
    ADD CONSTRAINT order_log_broker_id_fkey FOREIGN KEY (broker_id) REFERENCES public.broker(id);
 L   ALTER TABLE ONLY public.order_log DROP CONSTRAINT order_log_broker_id_fkey;
       public          postgres    false    204    246    3070         M           2606    18079 !   order_log order_log_group_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_log
    ADD CONSTRAINT order_log_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.at_group(id);
 K   ALTER TABLE ONLY public.order_log DROP CONSTRAINT order_log_group_id_fkey;
       public          postgres    false    246    216    3082         N           2606    18084 !   order_log order_log_order_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_log
    ADD CONSTRAINT order_log_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.order_order(id);
 K   ALTER TABLE ONLY public.order_log DROP CONSTRAINT order_log_order_id_fkey;
       public          postgres    false    246    234    3104         Q           2606    18117 (   order_log order_log_order_parent_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_log
    ADD CONSTRAINT order_log_order_parent_id_fkey FOREIGN KEY (order_parent_id) REFERENCES public.order_order(id);
 R   ALTER TABLE ONLY public.order_log DROP CONSTRAINT order_log_order_parent_id_fkey;
       public          postgres    false    246    234    3104         O           2606    18089 #   order_log order_log_profile_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_log
    ADD CONSTRAINT order_log_profile_id_fkey FOREIGN KEY (profile_id) REFERENCES public.risk_profile(id);
 M   ALTER TABLE ONLY public.order_log DROP CONSTRAINT order_log_profile_id_fkey;
       public          postgres    false    246    218    3086         P           2606    18094 $   order_log order_log_strategy_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_log
    ADD CONSTRAINT order_log_strategy_id_fkey FOREIGN KEY (strategy_id) REFERENCES public.strategy(id);
 N   ALTER TABLE ONLY public.order_log DROP CONSTRAINT order_log_strategy_id_fkey;
       public          postgres    false    220    3090    246         >           2606    17947 '   order_order order_order_account_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_order
    ADD CONSTRAINT order_order_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.account(id);
 Q   ALTER TABLE ONLY public.order_order DROP CONSTRAINT order_order_account_id_fkey;
       public          postgres    false    212    234    3078         4           2606    17815 )   risk_profile risk_profile_created_by_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_profile
    ADD CONSTRAINT risk_profile_created_by_fkey FOREIGN KEY (created_by) REFERENCES public."user"(id);
 S   ALTER TABLE ONLY public.risk_profile DROP CONSTRAINT risk_profile_created_by_fkey;
       public          postgres    false    218    3076    210         R           2606    18110    signals signals_order_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.signals
    ADD CONSTRAINT signals_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.order_order(id);
 G   ALTER TABLE ONLY public.signals DROP CONSTRAINT signals_order_id_fkey;
       public          postgres    false    248    234    3104         6           2606    17844 7   strategy_allocation strategy_allocation_created_by_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.strategy_allocation
    ADD CONSTRAINT strategy_allocation_created_by_fkey FOREIGN KEY (created_by) REFERENCES public."user"(id);
 a   ALTER TABLE ONLY public.strategy_allocation DROP CONSTRAINT strategy_allocation_created_by_fkey;
       public          postgres    false    3076    210    222         5           2606    17831 !   strategy strategy_created_by_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.strategy
    ADD CONSTRAINT strategy_created_by_fkey FOREIGN KEY (created_by) REFERENCES public."user"(id);
 K   ALTER TABLE ONLY public.strategy DROP CONSTRAINT strategy_created_by_fkey;
       public          postgres    false    210    3076    220         ?           2606    17960 U   strategy_strategy_allocation strategy_strategy_allocation_strategy_allocation_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.strategy_strategy_allocation
    ADD CONSTRAINT strategy_strategy_allocation_strategy_allocation_id_fkey FOREIGN KEY (strategy_allocation_id) REFERENCES public.strategy_allocation(id);
    ALTER TABLE ONLY public.strategy_strategy_allocation DROP CONSTRAINT strategy_strategy_allocation_strategy_allocation_id_fkey;
       public          postgres    false    222    3092    236         @           2606    17965 J   strategy_strategy_allocation strategy_strategy_allocation_strategy_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.strategy_strategy_allocation
    ADD CONSTRAINT strategy_strategy_allocation_strategy_id_fkey FOREIGN KEY (strategy_id) REFERENCES public.strategy(id);
 t   ALTER TABLE ONLY public.strategy_strategy_allocation DROP CONSTRAINT strategy_strategy_allocation_strategy_id_fkey;
       public          postgres    false    220    3090    236         A           2606    17978 ?   symbol_action_change symbol_action_change_action_change_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.symbol_action_change
    ADD CONSTRAINT symbol_action_change_action_change_id_fkey FOREIGN KEY (action_change_id) REFERENCES public.action_change(id);
 i   ALTER TABLE ONLY public.symbol_action_change DROP CONSTRAINT symbol_action_change_action_change_id_fkey;
       public          postgres    false    214    3080    238         B           2606    17983 8   symbol_action_change symbol_action_change_symbol_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.symbol_action_change
    ADD CONSTRAINT symbol_action_change_symbol_id_fkey FOREIGN KEY (symbol_id) REFERENCES public.symbol(id);
 b   ALTER TABLE ONLY public.symbol_action_change DROP CONSTRAINT symbol_action_change_symbol_id_fkey;
       public          postgres    false    238    3094    224         7           2606    17860    symbol symbol_created_by_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.symbol
    ADD CONSTRAINT symbol_created_by_fkey FOREIGN KEY (created_by) REFERENCES public."user"(id);
 G   ALTER TABLE ONLY public.symbol DROP CONSTRAINT symbol_created_by_fkey;
       public          postgres    false    210    3076    224         C           2606    17996 8   user_risk_profile user_risk_profile_risk_profile_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_risk_profile
    ADD CONSTRAINT user_risk_profile_risk_profile_id_fkey FOREIGN KEY (risk_profile_id) REFERENCES public.risk_profile(id);
 b   ALTER TABLE ONLY public.user_risk_profile DROP CONSTRAINT user_risk_profile_risk_profile_id_fkey;
       public          postgres    false    3086    240    218         D           2606    18001 0   user_risk_profile user_risk_profile_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_risk_profile
    ADD CONSTRAINT user_risk_profile_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);
 Z   ALTER TABLE ONLY public.user_risk_profile DROP CONSTRAINT user_risk_profile_user_id_fkey;
       public          postgres    false    3076    240    210                                                                                                                                                                                                                                                  3302.dat                                                                                            0000600 0004000 0002000 00000000005 14713710064 0014237 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3340.dat                                                                                            0000600 0004000 0002000 00000000005 14713710064 0014241 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3316.dat                                                                                            0000600 0004000 0002000 00000000005 14713710064 0014244 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3318.dat                                                                                            0000600 0004000 0002000 00000000005 14713710064 0014246 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3320.dat                                                                                            0000600 0004000 0002000 00000000005 14713710064 0014237 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3304.dat                                                                                            0000600 0004000 0002000 00000000005 14713710064 0014241 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3290.dat                                                                                            0000600 0004000 0002000 00000000022 14713710064 0014244 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        e20af7969275
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              3292.dat                                                                                            0000600 0004000 0002000 00000000005 14713710064 0014247 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3306.dat                                                                                            0000600 0004000 0002000 00000000005 14713710064 0014243 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3294.dat                                                                                            0000600 0004000 0002000 00000000005 14713710064 0014251 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3332.dat                                                                                            0000600 0004000 0002000 00000000005 14713710064 0014242 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3296.dat                                                                                            0000600 0004000 0002000 00000000005 14713710064 0014253 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3322.dat                                                                                            0000600 0004000 0002000 00000000005 14713710064 0014241 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3334.dat                                                                                            0000600 0004000 0002000 00000000005 14713710064 0014244 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3336.dat                                                                                            0000600 0004000 0002000 00000000005 14713710064 0014246 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3324.dat                                                                                            0000600 0004000 0002000 00000000005 14713710064 0014243 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3308.dat                                                                                            0000600 0004000 0002000 00000000005 14713710064 0014245 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3338.dat                                                                                            0000600 0004000 0002000 00000000005 14713710064 0014250 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3310.dat                                                                                            0000600 0004000 0002000 00000000005 14713710064 0014236 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3312.dat                                                                                            0000600 0004000 0002000 00000000005 14713710064 0014240 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3298.dat                                                                                            0000600 0004000 0002000 00000000005 14713710064 0014255 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3326.dat                                                                                            0000600 0004000 0002000 00000000005 14713710064 0014245 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3314.dat                                                                                            0000600 0004000 0002000 00000000005 14713710064 0014242 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3328.dat                                                                                            0000600 0004000 0002000 00000000005 14713710064 0014247 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3300.dat                                                                                            0000600 0004000 0002000 00000000005 14713710064 0014235 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3330.dat                                                                                            0000600 0004000 0002000 00000000005 14713710064 0014240 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           restore.sql                                                                                         0000600 0004000 0002000 00000173170 14713710064 0015400 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 13.13
-- Dumped by pg_dump version 13.13

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE dbalgotrading;
--
-- Name: dbalgotrading; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE dbalgotrading WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE dbalgotrading OWNER TO postgres;

\connect dbalgotrading

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: account; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account (
    id integer NOT NULL,
    number character varying NOT NULL,
    account_type character varying NOT NULL,
    currency character varying,
    initial_balance double precision,
    current_balance double precision,
    margin_available double precision,
    unrealized_pnl double precision,
    realized_pnl double precision,
    updated_at timestamp without time zone,
    created_by integer,
    created_at timestamp without time zone
);


ALTER TABLE public.account OWNER TO postgres;

--
-- Name: account_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.account_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_id_seq OWNER TO postgres;

--
-- Name: account_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.account_id_seq OWNED BY public.account.id;


--
-- Name: account_operation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_operation (
    id integer NOT NULL,
    account_id integer,
    broker_id integer,
    broker_name character varying,
    broker_acculated_pnl_amount double precision,
    broker_acculated_pnl_percentage integer,
    broker_acculated_pnl_currency character varying,
    broker_acculated_in_amount integer,
    broker_currency character varying,
    broker_asset_allocation_percentage integer,
    risk_profile_id integer,
    risk_profile_name character varying,
    risk_profile_acculated_pnl_amount double precision,
    risk_profile_acculated_pnl_percentage integer,
    risk_profile_acculated_pnl_currency character varying,
    risk_profile_acculated_in_amount integer,
    risk_profile_currency character varying,
    risk_profile_asset_allocation_percentage integer,
    group_id integer,
    group_name character varying,
    group_acculated_pnl_amount double precision,
    group_acculated_pnl_percentage integer,
    group_acculated_pnl_currency character varying,
    group_acculated_in_amount integer,
    group_currency character varying,
    group_asset_allocation_percentage integer,
    strategy_id integer,
    strategy_name character varying,
    strategy_acculated_pnl_amount double precision,
    strategy_acculated_pnl_percentage integer,
    strategy_acculated_pnl_currency character varying,
    strategy_acculated_in_amount integer,
    strategy_currency character varying,
    strategy_asset_allocation_percentage integer,
    created_at timestamp without time zone,
    "timestamp" timestamp without time zone
);


ALTER TABLE public.account_operation OWNER TO postgres;

--
-- Name: account_operation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.account_operation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_operation_id_seq OWNER TO postgres;

--
-- Name: account_operation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.account_operation_id_seq OWNED BY public.account_operation.id;


--
-- Name: account_strategy_position; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_strategy_position (
    id integer NOT NULL,
    account_id integer,
    strategy_id integer,
    symbol character varying,
    contract_symbol integer,
    currency character varying,
    "position" character varying,
    average_cost character varying,
    additional_info character varying
);


ALTER TABLE public.account_strategy_position OWNER TO postgres;

--
-- Name: account_strategy_position_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.account_strategy_position_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_strategy_position_id_seq OWNER TO postgres;

--
-- Name: account_strategy_position_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.account_strategy_position_id_seq OWNED BY public.account_strategy_position.id;


--
-- Name: account_summary; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_summary (
    id integer NOT NULL,
    account_id integer,
    account_type character varying,
    net_liquidation numeric,
    total_cash_value numeric,
    settled_cash numeric,
    accrued_cash numeric,
    buying_power numeric,
    gross_position_value numeric,
    available_funds numeric,
    full_maint_margin_req numeric,
    full_available_funds numeric,
    created_at timestamp without time zone
);


ALTER TABLE public.account_summary OWNER TO postgres;

--
-- Name: account_summary_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.account_summary_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_summary_id_seq OWNER TO postgres;

--
-- Name: account_summary_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.account_summary_id_seq OWNED BY public.account_summary.id;


--
-- Name: account_value; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_value (
    id integer NOT NULL,
    account_id integer,
    cash_balance numeric,
    realized_pnl numeric,
    unrealized_pnl numeric,
    market_value numeric,
    currency character varying,
    created_at timestamp without time zone
);


ALTER TABLE public.account_value OWNER TO postgres;

--
-- Name: account_value_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.account_value_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_value_id_seq OWNER TO postgres;

--
-- Name: account_value_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.account_value_id_seq OWNED BY public.account_value.id;


--
-- Name: action_change; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.action_change (
    id integer NOT NULL,
    name character varying,
    ticker character varying,
    exchange character varying,
    country_code character varying,
    type_value character varying,
    currency character varying,
    isin character varying,
    is_active boolean,
    created_by integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.action_change OWNER TO postgres;

--
-- Name: action_change_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.action_change_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.action_change_id_seq OWNER TO postgres;

--
-- Name: action_change_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.action_change_id_seq OWNED BY public.action_change.id;


--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO postgres;

--
-- Name: asset_manager_risk_profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.asset_manager_risk_profile (
    id integer NOT NULL,
    asset_manager_id integer,
    risk_profile_id integer
);


ALTER TABLE public.asset_manager_risk_profile OWNER TO postgres;

--
-- Name: asset_manager_risk_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.asset_manager_risk_profile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asset_manager_risk_profile_id_seq OWNER TO postgres;

--
-- Name: asset_manager_risk_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.asset_manager_risk_profile_id_seq OWNED BY public.asset_manager_risk_profile.id;


--
-- Name: at_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.at_group (
    id integer NOT NULL,
    uuid character varying,
    name character varying NOT NULL,
    description character varying,
    image_url character varying,
    performance text,
    symbol_distribution text,
    symbol text,
    strategies_composition text,
    strategy_distribution text,
    created_by integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.at_group OWNER TO postgres;

--
-- Name: at_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.at_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.at_group_id_seq OWNER TO postgres;

--
-- Name: at_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.at_group_id_seq OWNED BY public.at_group.id;


--
-- Name: broker; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.broker (
    id integer NOT NULL,
    name character varying,
    country character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.broker OWNER TO postgres;

--
-- Name: broker_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.broker_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.broker_id_seq OWNER TO postgres;

--
-- Name: broker_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.broker_id_seq OWNED BY public.broker.id;


--
-- Name: error_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.error_log (
    id integer NOT NULL,
    account_id integer,
    broker_id integer,
    broker_group_id integer,
    risk_profile_id integer,
    strategy_id integer,
    order_id integer,
    error_message character varying,
    error_datetime timestamp without time zone,
    quantity integer,
    amount numeric,
    currency character varying,
    position_type character varying,
    asset_allocation character varying,
    error_type character varying,
    current_condition character varying,
    set_condition character varying,
    gap character varying,
    "timestamp" timestamp without time zone,
    contract_symbol character varying
);


ALTER TABLE public.error_log OWNER TO postgres;

--
-- Name: error_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.error_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.error_log_id_seq OWNER TO postgres;

--
-- Name: error_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.error_log_id_seq OWNED BY public.error_log.id;


--
-- Name: exchange; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exchange (
    id integer NOT NULL,
    name character varying,
    open_from timestamp without time zone,
    open_until timestamp without time zone,
    country_code character varying,
    symbol character varying
);


ALTER TABLE public.exchange OWNER TO postgres;

--
-- Name: exchange_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.exchange_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exchange_id_seq OWNER TO postgres;

--
-- Name: exchange_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.exchange_id_seq OWNED BY public.exchange.id;


--
-- Name: group_risk_profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.group_risk_profile (
    id integer NOT NULL,
    group_id integer,
    risk_profile_id integer
);


ALTER TABLE public.group_risk_profile OWNER TO postgres;

--
-- Name: group_risk_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.group_risk_profile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.group_risk_profile_id_seq OWNER TO postgres;

--
-- Name: group_risk_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.group_risk_profile_id_seq OWNED BY public.group_risk_profile.id;


--
-- Name: order_fills; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_fills (
    id integer NOT NULL,
    order_id integer,
    execution_id character varying,
    contract_id character varying,
    commission double precision,
    currency character varying,
    released_pnl double precision
);


ALTER TABLE public.order_fills OWNER TO postgres;

--
-- Name: order_fills_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_fills_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_fills_id_seq OWNER TO postgres;

--
-- Name: order_fills_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_fills_id_seq OWNED BY public.order_fills.id;


--
-- Name: order_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_log (
    id integer NOT NULL,
    broker_id integer,
    broker_name character varying NOT NULL,
    profile_id integer,
    profile_name character varying NOT NULL,
    group_id integer,
    group_name character varying NOT NULL,
    strategy_id integer,
    strategy_name character varying NOT NULL,
    account_number character varying NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    contract_symbol character varying NOT NULL,
    contract_id integer NOT NULL,
    action character varying NOT NULL,
    quantity integer NOT NULL,
    order_type character varying NOT NULL,
    stop_price double precision,
    order_status character varying NOT NULL,
    filled integer NOT NULL,
    remaining integer NOT NULL,
    avg_fill_price double precision NOT NULL,
    currency character varying NOT NULL,
    exchange character varying NOT NULL,
    order_id integer,
    perm_id integer NOT NULL,
    total_commissions double precision NOT NULL,
    commission_currency character varying NOT NULL,
    net_trade_pnl integer,
    lag_time timestamp without time zone NOT NULL,
    created_at timestamp without time zone NOT NULL,
    order_parent_id integer,
    parent_perm_id integer,
    is_open_position boolean,
    direction_trade character varying
);


ALTER TABLE public.order_log OWNER TO postgres;

--
-- Name: order_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_log_id_seq OWNER TO postgres;

--
-- Name: order_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_log_id_seq OWNED BY public.order_log.id;


--
-- Name: order_order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_order (
    id integer NOT NULL,
    account_id integer,
    account_number character varying,
    parent_id integer,
    parent_perm_id integer,
    perm_id integer,
    exchange character varying,
    currency character varying,
    contract_id character varying,
    action character varying,
    order_id character varying,
    symbol character varying,
    order_type character varying,
    price double precision,
    quantity integer,
    status character varying,
    lmt_price double precision,
    aux_price double precision,
    tif character varying,
    filled integer,
    avg_fill_price integer,
    created_at timestamp without time zone,
    update_at timestamp without time zone,
    "timestamp" timestamp without time zone
);


ALTER TABLE public.order_order OWNER TO postgres;

--
-- Name: order_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_order_id_seq OWNER TO postgres;

--
-- Name: order_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_order_id_seq OWNED BY public.order_order.id;


--
-- Name: risk_profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.risk_profile (
    id integer NOT NULL,
    uuid character varying,
    name character varying NOT NULL,
    description character varying,
    min_score numeric,
    max_score numeric,
    image_url character varying,
    created_by integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.risk_profile OWNER TO postgres;

--
-- Name: risk_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.risk_profile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.risk_profile_id_seq OWNER TO postgres;

--
-- Name: risk_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.risk_profile_id_seq OWNED BY public.risk_profile.id;


--
-- Name: signals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.signals (
    id integer NOT NULL,
    order_id integer,
    symbol character varying,
    signal_type character varying,
    strategy character varying,
    "timestamp" timestamp without time zone
);


ALTER TABLE public.signals OWNER TO postgres;

--
-- Name: signals_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.signals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.signals_id_seq OWNER TO postgres;

--
-- Name: signals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.signals_id_seq OWNED BY public.signals.id;


--
-- Name: strategy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strategy (
    id integer NOT NULL,
    name character varying,
    is_active boolean,
    exchange_id integer,
    strategy_param_id integer,
    arn_location character varying,
    created_by integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.strategy OWNER TO postgres;

--
-- Name: strategy_allocation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strategy_allocation (
    id integer NOT NULL,
    asset_allocation double precision,
    created_by integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.strategy_allocation OWNER TO postgres;

--
-- Name: strategy_allocation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strategy_allocation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strategy_allocation_id_seq OWNER TO postgres;

--
-- Name: strategy_allocation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strategy_allocation_id_seq OWNED BY public.strategy_allocation.id;


--
-- Name: strategy_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strategy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strategy_id_seq OWNER TO postgres;

--
-- Name: strategy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strategy_id_seq OWNED BY public.strategy.id;


--
-- Name: strategy_params; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strategy_params (
    id integer NOT NULL,
    operational_hours text
);


ALTER TABLE public.strategy_params OWNER TO postgres;

--
-- Name: strategy_params_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strategy_params_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strategy_params_id_seq OWNER TO postgres;

--
-- Name: strategy_params_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strategy_params_id_seq OWNED BY public.strategy_params.id;


--
-- Name: strategy_strategy_allocation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strategy_strategy_allocation (
    id integer NOT NULL,
    strategy_id integer,
    strategy_allocation_id integer
);


ALTER TABLE public.strategy_strategy_allocation OWNER TO postgres;

--
-- Name: strategy_strategy_allocation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strategy_strategy_allocation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strategy_strategy_allocation_id_seq OWNER TO postgres;

--
-- Name: strategy_strategy_allocation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strategy_strategy_allocation_id_seq OWNED BY public.strategy_strategy_allocation.id;


--
-- Name: symbol; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.symbol (
    id integer NOT NULL,
    name character varying NOT NULL,
    ticker character varying,
    exchange character varying,
    country_code character varying,
    type_value character varying,
    currency character varying,
    isin character varying,
    is_active boolean,
    created_by integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.symbol OWNER TO postgres;

--
-- Name: symbol_action_change; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.symbol_action_change (
    id integer NOT NULL,
    symbol_id integer,
    action_change_id integer
);


ALTER TABLE public.symbol_action_change OWNER TO postgres;

--
-- Name: symbol_action_change_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.symbol_action_change_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.symbol_action_change_id_seq OWNER TO postgres;

--
-- Name: symbol_action_change_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.symbol_action_change_id_seq OWNED BY public.symbol_action_change.id;


--
-- Name: symbol_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.symbol_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.symbol_id_seq OWNER TO postgres;

--
-- Name: symbol_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.symbol_id_seq OWNED BY public.symbol.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    name character varying,
    email character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: user_risk_profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_risk_profile (
    id integer NOT NULL,
    user_id integer,
    risk_profile_id integer
);


ALTER TABLE public.user_risk_profile OWNER TO postgres;

--
-- Name: user_risk_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_risk_profile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_risk_profile_id_seq OWNER TO postgres;

--
-- Name: user_risk_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_risk_profile_id_seq OWNED BY public.user_risk_profile.id;


--
-- Name: account id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account ALTER COLUMN id SET DEFAULT nextval('public.account_id_seq'::regclass);


--
-- Name: account_operation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_operation ALTER COLUMN id SET DEFAULT nextval('public.account_operation_id_seq'::regclass);


--
-- Name: account_strategy_position id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_strategy_position ALTER COLUMN id SET DEFAULT nextval('public.account_strategy_position_id_seq'::regclass);


--
-- Name: account_summary id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_summary ALTER COLUMN id SET DEFAULT nextval('public.account_summary_id_seq'::regclass);


--
-- Name: account_value id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_value ALTER COLUMN id SET DEFAULT nextval('public.account_value_id_seq'::regclass);


--
-- Name: action_change id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.action_change ALTER COLUMN id SET DEFAULT nextval('public.action_change_id_seq'::regclass);


--
-- Name: asset_manager_risk_profile id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asset_manager_risk_profile ALTER COLUMN id SET DEFAULT nextval('public.asset_manager_risk_profile_id_seq'::regclass);


--
-- Name: at_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.at_group ALTER COLUMN id SET DEFAULT nextval('public.at_group_id_seq'::regclass);


--
-- Name: broker id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.broker ALTER COLUMN id SET DEFAULT nextval('public.broker_id_seq'::regclass);


--
-- Name: error_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.error_log ALTER COLUMN id SET DEFAULT nextval('public.error_log_id_seq'::regclass);


--
-- Name: exchange id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exchange ALTER COLUMN id SET DEFAULT nextval('public.exchange_id_seq'::regclass);


--
-- Name: group_risk_profile id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_risk_profile ALTER COLUMN id SET DEFAULT nextval('public.group_risk_profile_id_seq'::regclass);


--
-- Name: order_fills id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_fills ALTER COLUMN id SET DEFAULT nextval('public.order_fills_id_seq'::regclass);


--
-- Name: order_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_log ALTER COLUMN id SET DEFAULT nextval('public.order_log_id_seq'::regclass);


--
-- Name: order_order id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_order ALTER COLUMN id SET DEFAULT nextval('public.order_order_id_seq'::regclass);


--
-- Name: risk_profile id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.risk_profile ALTER COLUMN id SET DEFAULT nextval('public.risk_profile_id_seq'::regclass);


--
-- Name: signals id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.signals ALTER COLUMN id SET DEFAULT nextval('public.signals_id_seq'::regclass);


--
-- Name: strategy id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strategy ALTER COLUMN id SET DEFAULT nextval('public.strategy_id_seq'::regclass);


--
-- Name: strategy_allocation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strategy_allocation ALTER COLUMN id SET DEFAULT nextval('public.strategy_allocation_id_seq'::regclass);


--
-- Name: strategy_params id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strategy_params ALTER COLUMN id SET DEFAULT nextval('public.strategy_params_id_seq'::regclass);


--
-- Name: strategy_strategy_allocation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strategy_strategy_allocation ALTER COLUMN id SET DEFAULT nextval('public.strategy_strategy_allocation_id_seq'::regclass);


--
-- Name: symbol id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.symbol ALTER COLUMN id SET DEFAULT nextval('public.symbol_id_seq'::regclass);


--
-- Name: symbol_action_change id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.symbol_action_change ALTER COLUMN id SET DEFAULT nextval('public.symbol_action_change_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Name: user_risk_profile id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_risk_profile ALTER COLUMN id SET DEFAULT nextval('public.user_risk_profile_id_seq'::regclass);


--
-- Data for Name: account; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account (id, number, account_type, currency, initial_balance, current_balance, margin_available, unrealized_pnl, realized_pnl, updated_at, created_by, created_at) FROM stdin;
\.
COPY public.account (id, number, account_type, currency, initial_balance, current_balance, margin_available, unrealized_pnl, realized_pnl, updated_at, created_by, created_at) FROM '$$PATH$$/3302.dat';

--
-- Data for Name: account_operation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_operation (id, account_id, broker_id, broker_name, broker_acculated_pnl_amount, broker_acculated_pnl_percentage, broker_acculated_pnl_currency, broker_acculated_in_amount, broker_currency, broker_asset_allocation_percentage, risk_profile_id, risk_profile_name, risk_profile_acculated_pnl_amount, risk_profile_acculated_pnl_percentage, risk_profile_acculated_pnl_currency, risk_profile_acculated_in_amount, risk_profile_currency, risk_profile_asset_allocation_percentage, group_id, group_name, group_acculated_pnl_amount, group_acculated_pnl_percentage, group_acculated_pnl_currency, group_acculated_in_amount, group_currency, group_asset_allocation_percentage, strategy_id, strategy_name, strategy_acculated_pnl_amount, strategy_acculated_pnl_percentage, strategy_acculated_pnl_currency, strategy_acculated_in_amount, strategy_currency, strategy_asset_allocation_percentage, created_at, "timestamp") FROM stdin;
\.
COPY public.account_operation (id, account_id, broker_id, broker_name, broker_acculated_pnl_amount, broker_acculated_pnl_percentage, broker_acculated_pnl_currency, broker_acculated_in_amount, broker_currency, broker_asset_allocation_percentage, risk_profile_id, risk_profile_name, risk_profile_acculated_pnl_amount, risk_profile_acculated_pnl_percentage, risk_profile_acculated_pnl_currency, risk_profile_acculated_in_amount, risk_profile_currency, risk_profile_asset_allocation_percentage, group_id, group_name, group_acculated_pnl_amount, group_acculated_pnl_percentage, group_acculated_pnl_currency, group_acculated_in_amount, group_currency, group_asset_allocation_percentage, strategy_id, strategy_name, strategy_acculated_pnl_amount, strategy_acculated_pnl_percentage, strategy_acculated_pnl_currency, strategy_acculated_in_amount, strategy_currency, strategy_asset_allocation_percentage, created_at, "timestamp") FROM '$$PATH$$/3340.dat';

--
-- Data for Name: account_strategy_position; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_strategy_position (id, account_id, strategy_id, symbol, contract_symbol, currency, "position", average_cost, additional_info) FROM stdin;
\.
COPY public.account_strategy_position (id, account_id, strategy_id, symbol, contract_symbol, currency, "position", average_cost, additional_info) FROM '$$PATH$$/3316.dat';

--
-- Data for Name: account_summary; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_summary (id, account_id, account_type, net_liquidation, total_cash_value, settled_cash, accrued_cash, buying_power, gross_position_value, available_funds, full_maint_margin_req, full_available_funds, created_at) FROM stdin;
\.
COPY public.account_summary (id, account_id, account_type, net_liquidation, total_cash_value, settled_cash, accrued_cash, buying_power, gross_position_value, available_funds, full_maint_margin_req, full_available_funds, created_at) FROM '$$PATH$$/3318.dat';

--
-- Data for Name: account_value; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_value (id, account_id, cash_balance, realized_pnl, unrealized_pnl, market_value, currency, created_at) FROM stdin;
\.
COPY public.account_value (id, account_id, cash_balance, realized_pnl, unrealized_pnl, market_value, currency, created_at) FROM '$$PATH$$/3320.dat';

--
-- Data for Name: action_change; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.action_change (id, name, ticker, exchange, country_code, type_value, currency, isin, is_active, created_by, created_at, updated_at) FROM stdin;
\.
COPY public.action_change (id, name, ticker, exchange, country_code, type_value, currency, isin, is_active, created_by, created_at, updated_at) FROM '$$PATH$$/3304.dat';

--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alembic_version (version_num) FROM stdin;
\.
COPY public.alembic_version (version_num) FROM '$$PATH$$/3290.dat';

--
-- Data for Name: asset_manager_risk_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.asset_manager_risk_profile (id, asset_manager_id, risk_profile_id) FROM stdin;
\.
COPY public.asset_manager_risk_profile (id, asset_manager_id, risk_profile_id) FROM '$$PATH$$/3292.dat';

--
-- Data for Name: at_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.at_group (id, uuid, name, description, image_url, performance, symbol_distribution, symbol, strategies_composition, strategy_distribution, created_by, created_at, updated_at) FROM stdin;
\.
COPY public.at_group (id, uuid, name, description, image_url, performance, symbol_distribution, symbol, strategies_composition, strategy_distribution, created_by, created_at, updated_at) FROM '$$PATH$$/3306.dat';

--
-- Data for Name: broker; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.broker (id, name, country, created_at, updated_at) FROM stdin;
\.
COPY public.broker (id, name, country, created_at, updated_at) FROM '$$PATH$$/3294.dat';

--
-- Data for Name: error_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.error_log (id, account_id, broker_id, broker_group_id, risk_profile_id, strategy_id, order_id, error_message, error_datetime, quantity, amount, currency, position_type, asset_allocation, error_type, current_condition, set_condition, gap, "timestamp", contract_symbol) FROM stdin;
\.
COPY public.error_log (id, account_id, broker_id, broker_group_id, risk_profile_id, strategy_id, order_id, error_message, error_datetime, quantity, amount, currency, position_type, asset_allocation, error_type, current_condition, set_condition, gap, "timestamp", contract_symbol) FROM '$$PATH$$/3332.dat';

--
-- Data for Name: exchange; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exchange (id, name, open_from, open_until, country_code, symbol) FROM stdin;
\.
COPY public.exchange (id, name, open_from, open_until, country_code, symbol) FROM '$$PATH$$/3296.dat';

--
-- Data for Name: group_risk_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.group_risk_profile (id, group_id, risk_profile_id) FROM stdin;
\.
COPY public.group_risk_profile (id, group_id, risk_profile_id) FROM '$$PATH$$/3322.dat';

--
-- Data for Name: order_fills; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_fills (id, order_id, execution_id, contract_id, commission, currency, released_pnl) FROM stdin;
\.
COPY public.order_fills (id, order_id, execution_id, contract_id, commission, currency, released_pnl) FROM '$$PATH$$/3334.dat';

--
-- Data for Name: order_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_log (id, broker_id, broker_name, profile_id, profile_name, group_id, group_name, strategy_id, strategy_name, account_number, "timestamp", contract_symbol, contract_id, action, quantity, order_type, stop_price, order_status, filled, remaining, avg_fill_price, currency, exchange, order_id, perm_id, total_commissions, commission_currency, net_trade_pnl, lag_time, created_at, order_parent_id, parent_perm_id, is_open_position, direction_trade) FROM stdin;
\.
COPY public.order_log (id, broker_id, broker_name, profile_id, profile_name, group_id, group_name, strategy_id, strategy_name, account_number, "timestamp", contract_symbol, contract_id, action, quantity, order_type, stop_price, order_status, filled, remaining, avg_fill_price, currency, exchange, order_id, perm_id, total_commissions, commission_currency, net_trade_pnl, lag_time, created_at, order_parent_id, parent_perm_id, is_open_position, direction_trade) FROM '$$PATH$$/3336.dat';

--
-- Data for Name: order_order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_order (id, account_id, account_number, parent_id, parent_perm_id, perm_id, exchange, currency, contract_id, action, order_id, symbol, order_type, price, quantity, status, lmt_price, aux_price, tif, filled, avg_fill_price, created_at, update_at, "timestamp") FROM stdin;
\.
COPY public.order_order (id, account_id, account_number, parent_id, parent_perm_id, perm_id, exchange, currency, contract_id, action, order_id, symbol, order_type, price, quantity, status, lmt_price, aux_price, tif, filled, avg_fill_price, created_at, update_at, "timestamp") FROM '$$PATH$$/3324.dat';

--
-- Data for Name: risk_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.risk_profile (id, uuid, name, description, min_score, max_score, image_url, created_by, created_at, updated_at) FROM stdin;
\.
COPY public.risk_profile (id, uuid, name, description, min_score, max_score, image_url, created_by, created_at, updated_at) FROM '$$PATH$$/3308.dat';

--
-- Data for Name: signals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.signals (id, order_id, symbol, signal_type, strategy, "timestamp") FROM stdin;
\.
COPY public.signals (id, order_id, symbol, signal_type, strategy, "timestamp") FROM '$$PATH$$/3338.dat';

--
-- Data for Name: strategy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strategy (id, name, is_active, exchange_id, strategy_param_id, arn_location, created_by, created_at, updated_at) FROM stdin;
\.
COPY public.strategy (id, name, is_active, exchange_id, strategy_param_id, arn_location, created_by, created_at, updated_at) FROM '$$PATH$$/3310.dat';

--
-- Data for Name: strategy_allocation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strategy_allocation (id, asset_allocation, created_by, created_at, updated_at) FROM stdin;
\.
COPY public.strategy_allocation (id, asset_allocation, created_by, created_at, updated_at) FROM '$$PATH$$/3312.dat';

--
-- Data for Name: strategy_params; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strategy_params (id, operational_hours) FROM stdin;
\.
COPY public.strategy_params (id, operational_hours) FROM '$$PATH$$/3298.dat';

--
-- Data for Name: strategy_strategy_allocation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strategy_strategy_allocation (id, strategy_id, strategy_allocation_id) FROM stdin;
\.
COPY public.strategy_strategy_allocation (id, strategy_id, strategy_allocation_id) FROM '$$PATH$$/3326.dat';

--
-- Data for Name: symbol; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.symbol (id, name, ticker, exchange, country_code, type_value, currency, isin, is_active, created_by, created_at, updated_at) FROM stdin;
\.
COPY public.symbol (id, name, ticker, exchange, country_code, type_value, currency, isin, is_active, created_by, created_at, updated_at) FROM '$$PATH$$/3314.dat';

--
-- Data for Name: symbol_action_change; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.symbol_action_change (id, symbol_id, action_change_id) FROM stdin;
\.
COPY public.symbol_action_change (id, symbol_id, action_change_id) FROM '$$PATH$$/3328.dat';

--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (id, name, email, created_at, updated_at) FROM stdin;
\.
COPY public."user" (id, name, email, created_at, updated_at) FROM '$$PATH$$/3300.dat';

--
-- Data for Name: user_risk_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_risk_profile (id, user_id, risk_profile_id) FROM stdin;
\.
COPY public.user_risk_profile (id, user_id, risk_profile_id) FROM '$$PATH$$/3330.dat';

--
-- Name: account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_id_seq', 1, false);


--
-- Name: account_operation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_operation_id_seq', 1, false);


--
-- Name: account_strategy_position_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_strategy_position_id_seq', 1, false);


--
-- Name: account_summary_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_summary_id_seq', 1, false);


--
-- Name: account_value_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_value_id_seq', 1, false);


--
-- Name: action_change_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.action_change_id_seq', 1, false);


--
-- Name: asset_manager_risk_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.asset_manager_risk_profile_id_seq', 1, false);


--
-- Name: at_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.at_group_id_seq', 1, false);


--
-- Name: broker_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.broker_id_seq', 1, false);


--
-- Name: error_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.error_log_id_seq', 1, false);


--
-- Name: exchange_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.exchange_id_seq', 1, false);


--
-- Name: group_risk_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.group_risk_profile_id_seq', 1, false);


--
-- Name: order_fills_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_fills_id_seq', 1, false);


--
-- Name: order_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_log_id_seq', 1, false);


--
-- Name: order_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_order_id_seq', 1, false);


--
-- Name: risk_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.risk_profile_id_seq', 1, false);


--
-- Name: signals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.signals_id_seq', 1, false);


--
-- Name: strategy_allocation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strategy_allocation_id_seq', 1, false);


--
-- Name: strategy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strategy_id_seq', 1, false);


--
-- Name: strategy_params_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strategy_params_id_seq', 1, false);


--
-- Name: strategy_strategy_allocation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strategy_strategy_allocation_id_seq', 1, false);


--
-- Name: symbol_action_change_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.symbol_action_change_id_seq', 1, false);


--
-- Name: symbol_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.symbol_id_seq', 1, false);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 1, false);


--
-- Name: user_risk_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_risk_profile_id_seq', 1, false);


--
-- Name: account_operation account_operation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_operation
    ADD CONSTRAINT account_operation_pkey PRIMARY KEY (id);


--
-- Name: account account_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_pkey PRIMARY KEY (id);


--
-- Name: account_strategy_position account_strategy_position_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_strategy_position
    ADD CONSTRAINT account_strategy_position_pkey PRIMARY KEY (id);


--
-- Name: account_summary account_summary_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_summary
    ADD CONSTRAINT account_summary_pkey PRIMARY KEY (id);


--
-- Name: account_value account_value_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_value
    ADD CONSTRAINT account_value_pkey PRIMARY KEY (id);


--
-- Name: action_change action_change_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.action_change
    ADD CONSTRAINT action_change_pkey PRIMARY KEY (id);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: asset_manager_risk_profile asset_manager_risk_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asset_manager_risk_profile
    ADD CONSTRAINT asset_manager_risk_profile_pkey PRIMARY KEY (id);


--
-- Name: at_group at_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.at_group
    ADD CONSTRAINT at_group_pkey PRIMARY KEY (id);


--
-- Name: at_group at_group_uuid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.at_group
    ADD CONSTRAINT at_group_uuid_key UNIQUE (uuid);


--
-- Name: broker broker_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.broker
    ADD CONSTRAINT broker_pkey PRIMARY KEY (id);


--
-- Name: error_log error_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.error_log
    ADD CONSTRAINT error_log_pkey PRIMARY KEY (id);


--
-- Name: exchange exchange_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exchange
    ADD CONSTRAINT exchange_pkey PRIMARY KEY (id);


--
-- Name: group_risk_profile group_risk_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_risk_profile
    ADD CONSTRAINT group_risk_profile_pkey PRIMARY KEY (id);


--
-- Name: order_fills order_fills_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_fills
    ADD CONSTRAINT order_fills_pkey PRIMARY KEY (id);


--
-- Name: order_log order_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_log
    ADD CONSTRAINT order_log_pkey PRIMARY KEY (id);


--
-- Name: order_order order_order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_order
    ADD CONSTRAINT order_order_pkey PRIMARY KEY (id);


--
-- Name: risk_profile risk_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.risk_profile
    ADD CONSTRAINT risk_profile_pkey PRIMARY KEY (id);


--
-- Name: risk_profile risk_profile_uuid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.risk_profile
    ADD CONSTRAINT risk_profile_uuid_key UNIQUE (uuid);


--
-- Name: signals signals_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.signals
    ADD CONSTRAINT signals_pkey PRIMARY KEY (id);


--
-- Name: strategy_allocation strategy_allocation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strategy_allocation
    ADD CONSTRAINT strategy_allocation_pkey PRIMARY KEY (id);


--
-- Name: strategy_params strategy_params_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strategy_params
    ADD CONSTRAINT strategy_params_pkey PRIMARY KEY (id);


--
-- Name: strategy strategy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strategy
    ADD CONSTRAINT strategy_pkey PRIMARY KEY (id);


--
-- Name: strategy_strategy_allocation strategy_strategy_allocation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strategy_strategy_allocation
    ADD CONSTRAINT strategy_strategy_allocation_pkey PRIMARY KEY (id);


--
-- Name: symbol_action_change symbol_action_change_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.symbol_action_change
    ADD CONSTRAINT symbol_action_change_pkey PRIMARY KEY (id);


--
-- Name: symbol symbol_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.symbol
    ADD CONSTRAINT symbol_pkey PRIMARY KEY (id);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: user_risk_profile user_risk_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_risk_profile
    ADD CONSTRAINT user_risk_profile_pkey PRIMARY KEY (id);


--
-- Name: account account_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_created_by_fkey FOREIGN KEY (created_by) REFERENCES public."user"(id);


--
-- Name: account_operation account_operation_account_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_operation
    ADD CONSTRAINT account_operation_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.account(id);


--
-- Name: account_operation account_operation_broker_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_operation
    ADD CONSTRAINT account_operation_broker_id_fkey FOREIGN KEY (broker_id) REFERENCES public.broker(id);


--
-- Name: account_operation account_operation_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_operation
    ADD CONSTRAINT account_operation_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.at_group(id);


--
-- Name: account_operation account_operation_risk_profile_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_operation
    ADD CONSTRAINT account_operation_risk_profile_id_fkey FOREIGN KEY (risk_profile_id) REFERENCES public.risk_profile(id);


--
-- Name: account_operation account_operation_strategy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_operation
    ADD CONSTRAINT account_operation_strategy_id_fkey FOREIGN KEY (strategy_id) REFERENCES public.strategy(id);


--
-- Name: account_strategy_position account_strategy_position_account_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_strategy_position
    ADD CONSTRAINT account_strategy_position_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.account(id);


--
-- Name: account_strategy_position account_strategy_position_strategy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_strategy_position
    ADD CONSTRAINT account_strategy_position_strategy_id_fkey FOREIGN KEY (strategy_id) REFERENCES public.strategy(id);


--
-- Name: account_summary account_summary_account_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_summary
    ADD CONSTRAINT account_summary_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.account(id);


--
-- Name: account_value account_value_account_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_value
    ADD CONSTRAINT account_value_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.account(id);


--
-- Name: action_change action_change_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.action_change
    ADD CONSTRAINT action_change_created_by_fkey FOREIGN KEY (created_by) REFERENCES public."user"(id);


--
-- Name: at_group at_group_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.at_group
    ADD CONSTRAINT at_group_created_by_fkey FOREIGN KEY (created_by) REFERENCES public."user"(id);


--
-- Name: error_log error_log_account_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.error_log
    ADD CONSTRAINT error_log_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.account(id);


--
-- Name: error_log error_log_broker_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.error_log
    ADD CONSTRAINT error_log_broker_group_id_fkey FOREIGN KEY (broker_group_id) REFERENCES public.at_group(id);


--
-- Name: error_log error_log_broker_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.error_log
    ADD CONSTRAINT error_log_broker_id_fkey FOREIGN KEY (broker_id) REFERENCES public.broker(id);


--
-- Name: error_log error_log_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.error_log
    ADD CONSTRAINT error_log_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.order_order(id);


--
-- Name: error_log error_log_risk_profile_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.error_log
    ADD CONSTRAINT error_log_risk_profile_id_fkey FOREIGN KEY (risk_profile_id) REFERENCES public.risk_profile(id);


--
-- Name: error_log error_log_strategy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.error_log
    ADD CONSTRAINT error_log_strategy_id_fkey FOREIGN KEY (strategy_id) REFERENCES public.strategy(id);


--
-- Name: group_risk_profile group_risk_profile_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_risk_profile
    ADD CONSTRAINT group_risk_profile_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.at_group(id);


--
-- Name: group_risk_profile group_risk_profile_risk_profile_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_risk_profile
    ADD CONSTRAINT group_risk_profile_risk_profile_id_fkey FOREIGN KEY (risk_profile_id) REFERENCES public.risk_profile(id);


--
-- Name: order_fills order_fills_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_fills
    ADD CONSTRAINT order_fills_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.order_order(id);


--
-- Name: order_log order_log_broker_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_log
    ADD CONSTRAINT order_log_broker_id_fkey FOREIGN KEY (broker_id) REFERENCES public.broker(id);


--
-- Name: order_log order_log_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_log
    ADD CONSTRAINT order_log_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.at_group(id);


--
-- Name: order_log order_log_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_log
    ADD CONSTRAINT order_log_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.order_order(id);


--
-- Name: order_log order_log_order_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_log
    ADD CONSTRAINT order_log_order_parent_id_fkey FOREIGN KEY (order_parent_id) REFERENCES public.order_order(id);


--
-- Name: order_log order_log_profile_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_log
    ADD CONSTRAINT order_log_profile_id_fkey FOREIGN KEY (profile_id) REFERENCES public.risk_profile(id);


--
-- Name: order_log order_log_strategy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_log
    ADD CONSTRAINT order_log_strategy_id_fkey FOREIGN KEY (strategy_id) REFERENCES public.strategy(id);


--
-- Name: order_order order_order_account_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_order
    ADD CONSTRAINT order_order_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.account(id);


--
-- Name: risk_profile risk_profile_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.risk_profile
    ADD CONSTRAINT risk_profile_created_by_fkey FOREIGN KEY (created_by) REFERENCES public."user"(id);


--
-- Name: signals signals_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.signals
    ADD CONSTRAINT signals_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.order_order(id);


--
-- Name: strategy_allocation strategy_allocation_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strategy_allocation
    ADD CONSTRAINT strategy_allocation_created_by_fkey FOREIGN KEY (created_by) REFERENCES public."user"(id);


--
-- Name: strategy strategy_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strategy
    ADD CONSTRAINT strategy_created_by_fkey FOREIGN KEY (created_by) REFERENCES public."user"(id);


--
-- Name: strategy_strategy_allocation strategy_strategy_allocation_strategy_allocation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strategy_strategy_allocation
    ADD CONSTRAINT strategy_strategy_allocation_strategy_allocation_id_fkey FOREIGN KEY (strategy_allocation_id) REFERENCES public.strategy_allocation(id);


--
-- Name: strategy_strategy_allocation strategy_strategy_allocation_strategy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strategy_strategy_allocation
    ADD CONSTRAINT strategy_strategy_allocation_strategy_id_fkey FOREIGN KEY (strategy_id) REFERENCES public.strategy(id);


--
-- Name: symbol_action_change symbol_action_change_action_change_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.symbol_action_change
    ADD CONSTRAINT symbol_action_change_action_change_id_fkey FOREIGN KEY (action_change_id) REFERENCES public.action_change(id);


--
-- Name: symbol_action_change symbol_action_change_symbol_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.symbol_action_change
    ADD CONSTRAINT symbol_action_change_symbol_id_fkey FOREIGN KEY (symbol_id) REFERENCES public.symbol(id);


--
-- Name: symbol symbol_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.symbol
    ADD CONSTRAINT symbol_created_by_fkey FOREIGN KEY (created_by) REFERENCES public."user"(id);


--
-- Name: user_risk_profile user_risk_profile_risk_profile_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_risk_profile
    ADD CONSTRAINT user_risk_profile_risk_profile_id_fkey FOREIGN KEY (risk_profile_id) REFERENCES public.risk_profile(id);


--
-- Name: user_risk_profile user_risk_profile_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_risk_profile
    ADD CONSTRAINT user_risk_profile_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        