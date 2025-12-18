{{ config(
    schema='stable'
) }}

select distinct 
    sequencing_experiment_id,
    sequencing_center_id,
    external_id,
    experiment_date,
    experiment_strategy,
    is_paired_end,
    platform,
    instrument_model,
    visible,
    visibility_reason, 
    visibility_comment,

  -- I think these should be included? talk with BIX
    library_name,
    library_strand,
    library_prep,
    library_selection,
    max_insert_size,
    mean_insert_size,
    mean_depth,
    total_reads,
    mean_read_length
from {{ ref('int_sequencing_experiment')}}