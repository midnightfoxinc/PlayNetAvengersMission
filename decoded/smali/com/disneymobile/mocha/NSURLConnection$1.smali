.class final Lcom/disneymobile/mocha/NSURLConnection$1;
.super Ljava/lang/Object;
.source "NSURLConnection.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disneymobile/mocha/NSURLConnection;->sendSynchronousRequestReturningResponseAndError(Lcom/disneymobile/mocha/NSURLRequest;Lcom/disneymobile/mocha/support/Out;Lcom/disneymobile/mocha/support/Out;)Lcom/disneymobile/mocha/NSData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$outError:Lcom/disneymobile/mocha/support/Out;

.field final synthetic val$outResponse:Lcom/disneymobile/mocha/support/Out;

.field final synthetic val$returnData:Lcom/disneymobile/mocha/NSMutableData;


# direct methods
.method constructor <init>(Lcom/disneymobile/mocha/support/Out;Lcom/disneymobile/mocha/NSMutableData;Lcom/disneymobile/mocha/support/Out;)V
    .locals 0

    .prologue
    .line 40
    iput-object p1, p0, Lcom/disneymobile/mocha/NSURLConnection$1;->val$outResponse:Lcom/disneymobile/mocha/support/Out;

    iput-object p2, p0, Lcom/disneymobile/mocha/NSURLConnection$1;->val$returnData:Lcom/disneymobile/mocha/NSMutableData;

    iput-object p3, p0, Lcom/disneymobile/mocha/NSURLConnection$1;->val$outError:Lcom/disneymobile/mocha/support/Out;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public connectionDidFailWithError(Lcom/disneymobile/mocha/NSURLConnection;Lcom/disneymobile/mocha/NSError;)V
    .locals 2
    .param p1, "connection"    # Lcom/disneymobile/mocha/NSURLConnection;
    .param p2, "error"    # Lcom/disneymobile/mocha/NSError;
    .annotation runtime Lcom/disneymobile/mocha/support/SelectorTarget;
    .end annotation

    .prologue
    .line 57
    iget-object v0, p0, Lcom/disneymobile/mocha/NSURLConnection$1;->val$outResponse:Lcom/disneymobile/mocha/support/Out;

    invoke-virtual {v0}, Lcom/disneymobile/mocha/support/Out;->hasValue()Z

    move-result v0

    if-nez v0, :cond_0

    .line 58
    iget-object v0, p0, Lcom/disneymobile/mocha/NSURLConnection$1;->val$outResponse:Lcom/disneymobile/mocha/support/Out;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/disneymobile/mocha/support/Out;->setValue(Ljava/lang/Object;)V

    .line 59
    :cond_0
    iget-object v0, p0, Lcom/disneymobile/mocha/NSURLConnection$1;->val$outError:Lcom/disneymobile/mocha/support/Out;

    if-eqz v0, :cond_1

    .line 60
    iget-object v0, p0, Lcom/disneymobile/mocha/NSURLConnection$1;->val$outError:Lcom/disneymobile/mocha/support/Out;

    invoke-virtual {v0, p2}, Lcom/disneymobile/mocha/support/Out;->setValue(Ljava/lang/Object;)V

    .line 61
    :cond_1
    return-void
.end method

.method public connectionDidFinishLoading(Lcom/disneymobile/mocha/NSURLConnection;)V
    .locals 0
    .param p1, "connection"    # Lcom/disneymobile/mocha/NSURLConnection;
    .annotation runtime Lcom/disneymobile/mocha/support/SelectorTarget;
    .end annotation

    .prologue
    .line 53
    return-void
.end method

.method public connectionDidReceiveData(Lcom/disneymobile/mocha/NSURLConnection;[B)V
    .locals 1
    .param p1, "connection"    # Lcom/disneymobile/mocha/NSURLConnection;
    .param p2, "data"    # [B
    .annotation runtime Lcom/disneymobile/mocha/support/SelectorTarget;
    .end annotation

    .prologue
    .line 48
    iget-object v0, p0, Lcom/disneymobile/mocha/NSURLConnection$1;->val$returnData:Lcom/disneymobile/mocha/NSMutableData;

    invoke-virtual {v0, p2}, Lcom/disneymobile/mocha/NSMutableData;->appendDataByReference([B)V

    .line 49
    return-void
.end method

.method public connectionDidReceiveResponse(Lcom/disneymobile/mocha/NSURLConnection;Lcom/disneymobile/mocha/NSURLResponse;)V
    .locals 1
    .param p1, "connection"    # Lcom/disneymobile/mocha/NSURLConnection;
    .param p2, "response"    # Lcom/disneymobile/mocha/NSURLResponse;
    .annotation runtime Lcom/disneymobile/mocha/support/SelectorTarget;
    .end annotation

    .prologue
    .line 43
    iget-object v0, p0, Lcom/disneymobile/mocha/NSURLConnection$1;->val$outResponse:Lcom/disneymobile/mocha/support/Out;

    invoke-virtual {v0, p2}, Lcom/disneymobile/mocha/support/Out;->setValue(Ljava/lang/Object;)V

    .line 44
    return-void
.end method
