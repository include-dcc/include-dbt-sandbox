{{ config(materialized='table') }}

with base_data as (
    select * from {{ ref('kf_chr_18_src_chr_18_phenotype_data') }}
),
phenotype_list as (
    select phenotype from (
        values 
            ('chiari_2'), ('pituitary_gland_abn'), ('cleft_palate'), ('hearing_loss'), 
            ('tetralogy_of_fallot'), ('conductive_hearing_loss'), ('holoprosencephaly'), ('choanal_atresia'),
            ('aural_atresia'), ('midface_hypoplasia'), ('dysmyelination'), ('polymicrogyria'),
            ('cryptorchidism'), ('sensorineural_hearing_loss'), ('cleft_lip'), ('imperforate_anus'),
            ('microcephaly'), ('vertical_talus'), ('hypospadias'), ('rocker_bottom_foot'),
            ('chiari_1'), ('ptosis'), ('strabismus'), ('bilateral_coxa_valga'),
            ('cardiac_nos'), ('corpus_callosum_abn'), ('pulmonary_valve_stenosis'), ('metatarsus_varus'),
            ('decreased_white_matter_volume'), ('macrocephaly'), ('suprasellar_cyst'), ('hydrocephalus'),
            ('micropenis'), ('anal_stenosis'), ('congenital_heart_malformation'), ('bilateral_choanal_atresia'),
            ('dandy_walker_malformation'), ('dandy_walker'), ('congenital_heart_defect'), ('aural_stenosis'),
            ('kidney_malform'), ('pituitary_fossa_enlargement'), ('submucous_cleft'), ('virchow_robins_spaces'),
            ('retinal_coloboma'), ('corneal_staphyloma'), ('club_foot'), ('macroglossia'),
            ('dandy_walker_variant'), ('coanal_atresia'), ('occipatal_lobe_abn'), ('asd'),
            ('vsd'), ('pectus_excavatum'), ('peripherial_pulmonary_stenosis'), ('sagittal_stenosis'),
            ('hydronephrosis'), ('patent_ductus_arteriosus'), ('duanes_syndrome'), ('laryngomalacia'),
            ('metatarsus_adductus'), ('ptosisbilateral'), ('microphallus'), ('sacral_agenesis'),
            ('situs_inversus')
    ) as t(phenotype)
),
unpivoted_phenotypes as (
    select
        bd.family_id,
        bd.participant_id,
        bd.family_relationship_target_participant_id,
        bd.aliquot_id,
        bd.consent_group,
        bd.age_at_sample,
        bd.sample_composition,
        bd.race,
        bd.sex,
        bd.ethnicity,
        bd.analyte_type,
        bd.age_at_phenotype,
        bd.affected_status,
        bd.vital_status,
        bd.sample_tissue_type,
        pl.phenotype
    from base_data bd
    cross join phenotype_list pl
    where case pl.phenotype
        when 'chiari_2' then bd.chiari_2
        when 'pituitary_gland_abn' then bd.pituitary_gland_abn
        when 'cleft_palate' then bd.cleft_palate
        when 'hearing_loss' then bd.hearing_loss
        when 'tetralogy_of_fallot' then bd.tetralogy_of_fallot
        when 'conductive_hearing_loss' then bd.conductive_hearing_loss
        when 'holoprosencephaly' then bd.holoprosencephaly
        when 'choanal_atresia' then bd.choanal_atresia
        when 'aural_atresia' then bd.aural_atresia
        when 'midface_hypoplasia' then bd.midface_hypoplasia
        when 'dysmyelination' then bd.dysmyelination
        when 'polymicrogyria' then bd.polymicrogyria
        when 'cryptorchidism' then bd.cryptorchidism
        when 'sensorineural_hearing_loss' then bd.sensorineural_hearing_loss
        when 'cleft_lip' then bd.cleft_lip
        when 'imperforate_anus' then bd.imperforate_anus
        when 'microcephaly' then bd.microcephaly
        when 'vertical_talus' then bd.vertical_talus
        when 'hypospadias' then bd.hypospadias
        when 'rocker_bottom_foot' then bd.rocker_bottom_foot
        when 'chiari_1' then bd.chiari_1
        when 'ptosis' then bd.ptosis
        when 'strabismus' then bd.strabismus
        when 'bilateral_coxa_valga' then bd.bilateral_coxa_valga
        when 'cardiac_nos' then bd.cardiac_nos
        when 'corpus_callosum_abn' then bd.corpus_callosum_abn
        when 'pulmonary_valve_stenosis' then bd.pulmonary_valve_stenosis
        when 'metatarsus_varus' then bd.metatarsus_varus
        when 'decreased_white_matter_volume' then bd.decreased_white_matter_volume
        when 'macrocephaly' then bd.macrocephaly
        when 'suprasellar_cyst' then bd.suprasellar_cyst
        when 'hydrocephalus' then bd.hydrocephalus
        when 'micropenis' then bd.micropenis
        when 'anal_stenosis' then bd.anal_stenosis
        when 'congenital_heart_malformation' then bd.congenital_heart_malformation
        when 'bilateral_choanal_atresia' then bd.bilateral_choanal_atresia
        when 'dandy_walker_malformation' then bd.dandy_walker_malformation
        when 'dandy_walker' then bd.dandy_walker
        when 'congenital_heart_defect' then bd.congenital_heart_defect
        when 'aural_stenosis' then bd.aural_stenosis
        when 'kidney_malform' then bd.kidney_malform
        when 'pituitary_fossa_enlargement' then bd.pituitary_fossa_enlargement
        when 'submucous_cleft' then bd.submucous_cleft
        when 'virchow_robins_spaces' then bd.virchow_robins_spaces
        when 'retinal_coloboma' then bd.retinal_coloboma
        when 'corneal_staphyloma' then bd.corneal_staphyloma
        when 'club_foot' then bd.club_foot
        when 'macroglossia' then bd.macroglossia
        when 'dandy_walker_variant' then bd.dandy_walker_variant
        when 'coanal_atresia' then bd.coanal_atresia
        when 'occipatal_lobe_abn' then bd.occipatal_lobe_abn
        when 'asd' then bd.asd
        when 'vsd' then bd.vsd
        when 'pectus_excavatum' then bd.pectus_excavatum
        when 'peripherial_pulmonary_stenosis' then bd.peripherial_pulmonary_stenosis
        when 'sagittal_stenosis' then bd.sagittal_stenosis
        when 'hydronephrosis' then bd.hydronephrosis
        when 'patent_ductus_arteriosus' then bd.patent_ductus_arteriosus
        when 'duanes_syndrome' then bd.duanes_syndrome
        when 'laryngomalacia' then bd.laryngomalacia
        when 'metatarsus_adductus' then bd.metatarsus_adductus
        when 'ptosisbilateral' then bd.ptosisbilateral
        when 'microphallus' then bd.microphallus
        when 'sacral_agenesis' then bd.sacral_agenesis
        when 'situs_inversus' then bd.situs_inversus
    end = 'present'
)

select * from unpivoted_phenotypes
    
