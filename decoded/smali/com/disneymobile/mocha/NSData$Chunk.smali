.class public Lcom/disneymobile/mocha/NSData$Chunk;
.super Ljava/lang/Object;
.source "NSData.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/disneymobile/mocha/NSData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "Chunk"
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field data:[B

.field length:I


# direct methods
.method public constructor <init>([BI)V
    .locals 0
    .param p1, "data"    # [B
    .param p2, "length"    # I

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput-object p1, p0, Lcom/disneymobile/mocha/NSData$Chunk;->data:[B

    .line 36
    iput p2, p0, Lcom/disneymobile/mocha/NSData$Chunk;->length:I

    .line 37
    return-void
.end method
