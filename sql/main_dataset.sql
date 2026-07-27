SELECT

    s.date AS session_date,
    s.ga_session_id,

    sp.continent,
    sp.country,

    sp.device,
    sp.browser,
    sp.mobile_model_name,
    sp.operating_system,
    sp.language,

    sp.medium,
    sp.name AS traffic_source_name,
    sp.channel,

    a.id AS account_id,
    a.is_verified,
    a.is_unsubscribed,

    p.category,
    p.name AS product_name,
    p.price,
    p.short_description

FROM `data-analytics-mate.DA.session` s

LEFT JOIN `data-analytics-mate.DA.session_params` sp
ON s.ga_session_id = sp.ga_session_id

LEFT JOIN `data-analytics-mate.DA.order` o
ON s.ga_session_id = o.ga_session_id

LEFT JOIN `data-analytics-mate.DA.product` p
ON o.item_id = p.item_id

LEFT JOIN `data-analytics-mate.DA.account_session` acc_s
ON s.ga_session_id = acc_s.ga_session_id

LEFT JOIN `data-analytics-mate.DA.account` a
ON acc_s.account_id = a.id