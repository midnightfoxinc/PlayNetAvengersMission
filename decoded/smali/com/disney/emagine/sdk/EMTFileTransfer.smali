.class public Lcom/disney/emagine/sdk/EMTFileTransfer;
.super Ljava/lang/Object;
.source "EMTFileTransfer.java"


# instance fields
.field public contents:[B

.field public crc32:J

.field public deviceId:J

.field public expectedLength:J

.field public extras:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public fileVersion:I

.field public filename:Ljava/lang/String;

.field public flags:B

.field public headerLength:J

.field public lastAckedFrameCounter:J

.field public offset:J

.field public packetSize:I

.field public previousOffset:J

.field public resetOffset:J

.field public transferAccepted:Z

.field public uncompressedContents:[B


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
