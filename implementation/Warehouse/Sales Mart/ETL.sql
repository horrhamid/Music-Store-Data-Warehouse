USE [DataWarehouse]
GO
CREATE OR ALTER PROCEDURE DW_dimensions
AS
BEGIN
    ----------dimensions-------------
    EXECUTE ETL_DimensionGenre
    EXECUTE ETL_DimensionMediaType
    EXECUTE ETL_DimensionArtist
    EXECUTE ETL_DimensionLocation
    EXEC ETL_DimensionCustomer
    EXEC ETL_DimensionTrack
    exec ETL_DimensionAlbum
    exec ETL_DimensionEmployee
END
GO


CREATE OR ALTER PROCEDURE DW_Mart_Sale
AS
BEGIN

    EXEC ETL_Sale_firstLoadTransFact
    EXEC ETL_Sale_incrementalTransFact
    exec ETL_Sale_firstLoadFactDaily
    EXEC ETL_Sale_FactDaily
    EXEC ETL_Sale_ACCFact
END


GO
CREATE OR ALTER PROCEDURE DW_Main_Procedure
AS
BEGIN
    EXEC DW_dimensions
    exec DW_Mart_Sale
END





EXEC DW_Main_Procedure




