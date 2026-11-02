.class Lcom/disneymobile/mocha/NSData$NSDataInputStream;
.super Ljava/io/InputStream;
.source "NSData.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/disneymobile/mocha/NSData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "NSDataInputStream"
.end annotation


# instance fields
.field private current:Lcom/disneymobile/mocha/NSData$Chunk;

.field private final iterator:Ljava/util/Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Iterator",
            "<",
            "Lcom/disneymobile/mocha/NSData$Chunk;",
            ">;"
        }
    .end annotation
.end field

.field private position:I

.field final synthetic this$0:Lcom/disneymobile/mocha/NSData;


# direct methods
.method public constructor <init>(Lcom/disneymobile/mocha/NSData;)V
    .locals 1

    .prologue
    .line 104
    iput-object p1, p0, Lcom/disneymobile/mocha/NSData$NSDataInputStream;->this$0:Lcom/disneymobile/mocha/NSData;

    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 105
    iget-object v0, p1, Lcom/disneymobile/mocha/NSData;->chunks:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    iput-object v0, p0, Lcom/disneymobile/mocha/NSData$NSDataInputStream;->iterator:Ljava/util/Iterator;

    .line 106
    const/4 v0, 0x0

    iput v0, p0, Lcom/disneymobile/mocha/NSData$NSDataInputStream;->position:I

    .line 107
    return-void
.end method


# virtual methods
.method public read()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 111
    iget-object v0, p0, Lcom/disneymobile/mocha/NSData$NSDataInputStream;->current:Lcom/disneymobile/mocha/NSData$Chunk;

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/disneymobile/mocha/NSData$NSDataInputStream;->position:I

    iget-object v1, p0, Lcom/disneymobile/mocha/NSData$NSDataInputStream;->current:Lcom/disneymobile/mocha/NSData$Chunk;

    iget v1, v1, Lcom/disneymobile/mocha/NSData$Chunk;->length:I

    if-lt v0, v1, :cond_0

    .line 112
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/disneymobile/mocha/NSData$NSDataInputStream;->current:Lcom/disneymobile/mocha/NSData$Chunk;

    .line 114
    :cond_0
    iget-object v0, p0, Lcom/disneymobile/mocha/NSData$NSDataInputStream;->current:Lcom/disneymobile/mocha/NSData$Chunk;

    if-nez v0, :cond_1

    .line 115
    iget-object v0, p0, Lcom/disneymobile/mocha/NSData$NSDataInputStream;->iterator:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 116
    iget-object v0, p0, Lcom/disneymobile/mocha/NSData$NSDataInputStream;->iterator:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/disneymobile/mocha/NSData$Chunk;

    iput-object v0, p0, Lcom/disneymobile/mocha/NSData$NSDataInputStream;->current:Lcom/disneymobile/mocha/NSData$Chunk;

    .line 117
    const/4 v0, 0x0

    iput v0, p0, Lcom/disneymobile/mocha/NSData$NSDataInputStream;->position:I

    .line 122
    :cond_1
    iget-object v0, p0, Lcom/disneymobile/mocha/NSData$NSDataInputStream;->current:Lcom/disneymobile/mocha/NSData$Chunk;

    iget-object v0, v0, Lcom/disneymobile/mocha/NSData$Chunk;->data:[B

    iget v1, p0, Lcom/disneymobile/mocha/NSData$NSDataInputStream;->position:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/disneymobile/mocha/NSData$NSDataInputStream;->position:I

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    :goto_0
    return v0

    .line 119
    :cond_2
    const/4 v0, -0x1

    goto :goto_0
.end method
