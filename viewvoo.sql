
--Create view
----------------------------------------------------------------------------
CREATE OR REPLACE VIEW VooGab AS
    SELECT 
        PPASS.nome AS nome_passageiro,
        PPASS.cpf AS CPF_passageiro,
        PPASS.telefone AS telefone_passageiro,
        voo.Numero_voo, 
        voo.data_hora_decolagem, 
        voo.data_hora_pouso, 
        passagem.numero_assento AS numero_assento,
        PPiloto.nome AS piloto_nome, 
        CPiloto.nome AS copiloto_nome, 
        ADecolagem.nome AS aeroporto_decolagem_nome, 
        CAD.nome_cidade AS aeroporto_decolagem_cidade, 
        PCAD.nome_pais AS aeroporto_decolagem_pais, 
        APouso.nome AS aeroporto_pouso_nome, 
        CAP.nome_cidade AS aeroporto_pouso_cidade, 
        PCAP.nome_pais AS aeroporto_pouso_pais,
        tipo_aeronave.nome AS aeronave_nome, 
        tipo_aeronave.sigla AS aeronave_sigla
    from passagem
        JOIN voo ON passagem.id = voo.id
        JOIN pessoa AS PPASS ON passagem.id = PPASS.id
        JOIN pessoa AS PPiloto ON  voo.piloto_id = PPiloto.id
        JOIN pessoa AS CPiloto ON  voo.copiloto_id = CPiloto.id         
        JOIN aeroporto AS ADecolagem ON voo.aeroporto_decolagem = ADecolagem.sigla
        JOIN cidade AS CAD ON ADecolagem.cidade_id = CAD.codigo
        JOIN pais AS PCAD ON CAD.codigo = PCAD.id
        JOIN aeroporto AS APouso ON voo.aeroporto_pouso = APouso.sigla
        JOIN cidade AS CAP ON ADecolagem.cidade_id = CAD.codigo
        JOIN pais AS PCAP ON CAD.codigo = PCAD.id
        JOIN aeronave ON voo.aeronave = aeronave.tipo_sigla
        JOIN tipo_aeronave ON aeronave.tipo_sigla = tipo_aeronave.sigla;