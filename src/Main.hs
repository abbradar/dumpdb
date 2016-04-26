import qualified Data.ByteString.Lazy as LBS
import Control.Monad.Trans.Resource
import Control.Monad.Logger
import Data.Conduit
import qualified Data.Conduit.List as C
import Data.Conduit.Binary
import qualified Data.Aeson as JSON
import Database.Persist.Sql
import Database.Persist.Postgresql

import MyDatabase

connection :: ConnectionString
connection = ""

outFile :: FilePath
outFile = "output.json"

main :: IO ()
main =
  runResourceT $
  runStderrLoggingT $
  withPostgresqlConn connection $
  runSqlConn $ do
    runMigration migrateAll
    selectSource [] [] $$ C.map (JSON.encode :: Entity Person -> _) =$ C.concatMap LBS.toChunks =$ sinkFile outFile
