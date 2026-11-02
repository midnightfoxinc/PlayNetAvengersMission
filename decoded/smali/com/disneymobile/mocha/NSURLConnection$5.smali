.class Lcom/disneymobile/mocha/NSURLConnection$5;
.super Ljava/lang/Object;
.source "NSURLConnection.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disneymobile/mocha/NSURLConnection;->fire_connectionDidFailWithError(Lcom/disneymobile/mocha/NSError;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disneymobile/mocha/NSURLConnection;

.field final synthetic val$error:Lcom/disneymobile/mocha/NSError;


# direct methods
.method constructor <init>(Lcom/disneymobile/mocha/NSURLConnection;Lcom/disneymobile/mocha/NSError;)V
    .locals 0

    .prologue
    .line 210
    iput-object p1, p0, Lcom/disneymobile/mocha/NSURLConnection$5;->this$0:Lcom/disneymobile/mocha/NSURLConnection;

    iput-object p2, p0, Lcom/disneymobile/mocha/NSURLConnection$5;->val$error:Lcom/disneymobile/mocha/NSError;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 212
    new-instance v0, Lcom/disneymobile/mocha/support/Selector;

    const-string v1, "connectionDidFailWithError"

    invoke-direct {v0, v1}, Lcom/disneymobile/mocha/support/Selector;-><init>(Ljava/lang/String;)V

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/disneymobile/mocha/NSURLConnection$5;->this$0:Lcom/disneymobile/mocha/NSURLConnection;

    iget-object v2, v2, Lcom/disneymobile/mocha/NSURLConnection;->delegate:Ljava/lang/Object;

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/disneymobile/mocha/NSURLConnection$5;->this$0:Lcom/disneymobile/mocha/NSURLConnection;

    aput-object v5, v3, v4

    const/4 v4, 0x1

    iget-object v5, p0, Lcom/disneymobile/mocha/NSURLConnection$5;->val$error:Lcom/disneymobile/mocha/NSError;

    aput-object v5, v3, v4

    invoke-virtual {v0, v1, v2, v3}, Lcom/disneymobile/mocha/support/Selector;->invokeIfRespondsToSelectorWithError(Lcom/disneymobile/mocha/support/Out;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 213
    return-void
.end method
