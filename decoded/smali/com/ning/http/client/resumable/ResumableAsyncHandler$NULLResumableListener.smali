.class Lcom/ning/http/client/resumable/ResumableAsyncHandler$NULLResumableListener;
.super Ljava/lang/Object;
.source "ResumableAsyncHandler.java"

# interfaces
.implements Lcom/ning/http/client/resumable/ResumableListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/resumable/ResumableAsyncHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "NULLResumableListener"
.end annotation


# instance fields
.field private length:J


# direct methods
.method private constructor <init>()V
    .locals 2

    .prologue
    .line 292
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 294
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/ning/http/client/resumable/ResumableAsyncHandler$NULLResumableListener;->length:J

    return-void
.end method

.method synthetic constructor <init>(Lcom/ning/http/client/resumable/ResumableAsyncHandler$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/ning/http/client/resumable/ResumableAsyncHandler$1;

    .prologue
    .line 292
    invoke-direct {p0}, Lcom/ning/http/client/resumable/ResumableAsyncHandler$NULLResumableListener;-><init>()V

    return-void
.end method


# virtual methods
.method public length()J
    .locals 2

    .prologue
    .line 304
    iget-wide v0, p0, Lcom/ning/http/client/resumable/ResumableAsyncHandler$NULLResumableListener;->length:J

    return-wide v0
.end method

.method public onAllBytesReceived()V
    .locals 0

    .prologue
    .line 301
    return-void
.end method

.method public onBytesReceived(Ljava/nio/ByteBuffer;)V
    .locals 4
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 297
    iget-wide v0, p0, Lcom/ning/http/client/resumable/ResumableAsyncHandler$NULLResumableListener;->length:J

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    int-to-long v2, v2

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/ning/http/client/resumable/ResumableAsyncHandler$NULLResumableListener;->length:J

    .line 298
    return-void
.end method
