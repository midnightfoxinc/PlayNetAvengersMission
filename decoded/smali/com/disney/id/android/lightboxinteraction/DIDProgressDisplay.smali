.class public Lcom/disney/id/android/lightboxinteraction/DIDProgressDisplay;
.super Ljava/lang/Object;
.source "DIDProgressDisplay.java"


# static fields
.field private static final TAG_DID_PROGRESS:Ljava/lang/String; = "DID_PROGRESS"


# instance fields
.field private activity:Landroid/support/v4/app/FragmentActivity;

.field private progressView:Lcom/disney/id/android/DIDProgress;


# direct methods
.method public constructor <init>(Landroid/support/v4/app/FragmentActivity;)V
    .locals 1
    .param p1, "activity"    # Landroid/support/v4/app/FragmentActivity;

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    iput-object p1, p0, Lcom/disney/id/android/lightboxinteraction/DIDProgressDisplay;->activity:Landroid/support/v4/app/FragmentActivity;

    .line 20
    new-instance v0, Lcom/disney/id/android/DIDProgress;

    invoke-direct {v0}, Lcom/disney/id/android/DIDProgress;-><init>()V

    iput-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDProgressDisplay;->progressView:Lcom/disney/id/android/DIDProgress;

    .line 21
    return-void
.end method


# virtual methods
.method public isProgressShowing()Z
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDProgressDisplay;->progressView:Lcom/disney/id/android/DIDProgress;

    invoke-virtual {v0}, Lcom/disney/id/android/DIDProgress;->isVisible()Z

    move-result v0

    return v0
.end method

.method public onProgress(I)V
    .locals 1
    .param p1, "progress"    # I

    .prologue
    .line 36
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDProgressDisplay;->activity:Landroid/support/v4/app/FragmentActivity;

    invoke-static {v0}, Lcom/disney/id/android/DIDUtils;->isContextAlive(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 37
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDProgressDisplay;->progressView:Lcom/disney/id/android/DIDProgress;

    invoke-virtual {v0, p1}, Lcom/disney/id/android/DIDProgress;->setProgress(I)V

    .line 39
    :cond_0
    return-void
.end method

.method public startProgress()V
    .locals 5

    .prologue
    .line 24
    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDProgressDisplay;->activity:Landroid/support/v4/app/FragmentActivity;

    invoke-static {v1}, Lcom/disney/id/android/DIDUtils;->isContextAlive(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 25
    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDProgressDisplay;->activity:Landroid/support/v4/app/FragmentActivity;

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    .line 26
    .local v0, "fm":Landroid/support/v4/app/FragmentManager;
    invoke-virtual {v0}, Landroid/support/v4/app/FragmentManager;->isDestroyed()Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "DID_PROGRESS"

    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v1

    if-nez v1, :cond_0

    .line 28
    :try_start_0
    invoke-virtual {v0}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v1

    const v2, 0x1020002

    iget-object v3, p0, Lcom/disney/id/android/lightboxinteraction/DIDProgressDisplay;->progressView:Lcom/disney/id/android/DIDProgress;

    const-string v4, "DID_PROGRESS"

    invoke-virtual {v1, v2, v3, v4}, Landroid/support/v4/app/FragmentTransaction;->add(ILandroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentTransaction;->commitAllowingStateLoss()I
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 33
    .end local v0    # "fm":Landroid/support/v4/app/FragmentManager;
    :cond_0
    :goto_0
    return-void

    .line 29
    .restart local v0    # "fm":Landroid/support/v4/app/FragmentManager;
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public stopProgress()V
    .locals 3

    .prologue
    .line 42
    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDProgressDisplay;->activity:Landroid/support/v4/app/FragmentActivity;

    invoke-static {v1}, Lcom/disney/id/android/DIDUtils;->isContextAlive(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 43
    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDProgressDisplay;->activity:Landroid/support/v4/app/FragmentActivity;

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    .line 44
    .local v0, "fm":Landroid/support/v4/app/FragmentManager;
    invoke-virtual {v0}, Landroid/support/v4/app/FragmentManager;->isDestroyed()Z

    move-result v1

    if-nez v1, :cond_0

    .line 46
    :try_start_0
    invoke-virtual {v0}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v1

    iget-object v2, p0, Lcom/disney/id/android/lightboxinteraction/DIDProgressDisplay;->progressView:Lcom/disney/id/android/DIDProgress;

    invoke-virtual {v1, v2}, Landroid/support/v4/app/FragmentTransaction;->remove(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentTransaction;->commitAllowingStateLoss()I
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 51
    .end local v0    # "fm":Landroid/support/v4/app/FragmentManager;
    :cond_0
    :goto_0
    return-void

    .line 47
    .restart local v0    # "fm":Landroid/support/v4/app/FragmentManager;
    :catch_0
    move-exception v1

    goto :goto_0
.end method
