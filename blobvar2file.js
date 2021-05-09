// as found on https://github.com/oracle/oracle-db-tools/issues/8
var blobvar = null;
if (ctx.getVarMap().get(args[1].toUpperCase()).isLastSetObj()) {
blobvar = ctx.getVarMap().get(args[1].toUpperCase()).getValueObj();
var blobStream = blobvar.getBinaryStream(1);
var path = java.nio.file.FileSystems.getDefault().getPath(args[2]);
java.nio.file.Files.copy(blobStream ,path);
}
