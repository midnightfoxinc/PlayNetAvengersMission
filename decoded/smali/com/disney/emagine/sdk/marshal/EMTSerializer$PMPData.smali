.class public Lcom/disney/emagine/sdk/marshal/EMTSerializer$PMPData;
.super Ljava/lang/Object;
.source "EMTSerializer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/disney/emagine/sdk/marshal/EMTSerializer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "PMPData"
.end annotation


# instance fields
.field public data:[B

.field public numChunks:I

.field final synthetic this$0:Lcom/disney/emagine/sdk/marshal/EMTSerializer;


# direct methods
.method public constructor <init>(Lcom/disney/emagine/sdk/marshal/EMTSerializer;)V
    .locals 1
    .param p1, "this$0"    # Lcom/disney/emagine/sdk/marshal/EMTSerializer;

    .prologue
    .line 27
    iput-object p1, p0, Lcom/disney/emagine/sdk/marshal/EMTSerializer$PMPData;->this$0:Lcom/disney/emagine/sdk/marshal/EMTSerializer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    const/4 v0, 0x0

    iput v0, p0, Lcom/disney/emagine/sdk/marshal/EMTSerializer$PMPData;->numChunks:I

    return-void
.end method
