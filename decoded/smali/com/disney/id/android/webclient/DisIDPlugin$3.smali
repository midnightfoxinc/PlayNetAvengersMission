.class Lcom/disney/id/android/webclient/DisIDPlugin$3;
.super Ljava/lang/Object;
.source "DisIDPlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/id/android/webclient/DisIDPlugin;->onDisidLogout()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/id/android/webclient/DisIDPlugin;


# direct methods
.method constructor <init>(Lcom/disney/id/android/webclient/DisIDPlugin;)V
    .locals 0
    .param p1, "this$0"    # Lcom/disney/id/android/webclient/DisIDPlugin;

    .prologue
    .line 177
    iput-object p1, p0, Lcom/disney/id/android/webclient/DisIDPlugin$3;->this$0:Lcom/disney/id/android/webclient/DisIDPlugin;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 179
    iget-object v0, p0, Lcom/disney/id/android/webclient/DisIDPlugin$3;->this$0:Lcom/disney/id/android/webclient/DisIDPlugin;

    iget-object v0, v0, Lcom/disney/id/android/webclient/DisIDPlugin;->mDID:Lcom/disney/id/android/DIDSession;

    invoke-virtual {v0}, Lcom/disney/id/android/DIDSession;->logout()V

    .line 190
    return-void
.end method
