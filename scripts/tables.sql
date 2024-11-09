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

