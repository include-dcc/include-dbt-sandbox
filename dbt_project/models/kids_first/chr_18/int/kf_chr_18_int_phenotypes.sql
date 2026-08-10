{{ config(materialized='table') }}

with base_data as (
    select * from {{ ref('kf_chr_18_src_chr_18_phenotype_data') }}
),
unpivoted_phenotypes as (
    select
        participant_id,
        age_at_phenotype,
        phenotype
    from base_data
    unpivot (
        value for phenotype in (
            chiari_2,
            pituitary_gland_abn,
            cleft_palate,
            hearing_loss,
            tetralogy_of_fallot,
            conductive_hearing_loss,
            holoprosencephaly,
            choanal_atresia,
            aural_atresia,
            midface_hypoplasia,
            dysmyelination,
            polymicrogyria,
            cryptorchidism,
            sensorineural_hearing_loss,
            cleft_lip,
            imperforate_anus,
            microcephaly,
            vertical_talus,
            hypospadias,
            rocker_bottom_foot,
            chiari_1,
            ptosis,
            strabismus,
            bilateral_coxa_valga,
            cardiac_nos,
            corpus_callosum_abn,
            pulmonary_valve_stenosis,
            metatarsus_varus,
            decreased_white_matter_volume,
            macrocephaly,
            suprasellar_cyst,
            hydrocephalus,
            micropenis,
            anal_stenosis,
            congenital_heart_malformation,
            bilateral_choanal_atresia,
            dandy_walker_malformation,
            dandy_walker,
            congenital_heart_defect,
            aural_stenosis,
            kidney_malform,
            pituitary_fossa_enlargement,
            submucous_cleft,
            virchow_robins_spaces,
            retinal_coloboma,
            corneal_staphyloma,
            club_foot,
            macroglossia,
            dandy_walker_variant,
            coanal_atresia,
            occipatal_lobe_abn,
            asd,
            vsd,
            pectus_excavatum,
            peripherial_pulmonary_stenosis,
            sagittal_stenosis,
            hydronephrosis,
            patent_ductus_arteriosus,
            duanes_syndrome,
            laryngomalacia,
            metatarsus_adductus,
            ptosisbilateral,
            microphallus,
            sacral_agenesis,
            situs_inversus
        )
    )
    where value = 'present'
)

select * from unpivoted_phenotypes
    
