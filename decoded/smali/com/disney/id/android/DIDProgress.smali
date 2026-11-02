.class public Lcom/disney/id/android/DIDProgress;
.super Landroid/support/v4/app/Fragment;
.source "DIDProgress.java"


# static fields
.field private static final DID_PROGRESS_BAR:Ljava/lang/String; = "did_progress_bar"

.field private static final DID_PROGRESS_LAYOUT:Ljava/lang/String; = "did_progress_layout"


# instance fields
.field private mProgressBar:Landroid/widget/ProgressBar;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 5
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 20
    invoke-virtual {p0}, Lcom/disney/id/android/DIDProgress;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const-string v2, "did_progress_layout"

    const-string v3, "layout"

    invoke-virtual {p0}, Lcom/disney/id/android/DIDProgress;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v4

    invoke-virtual {v4}, Landroid/support/v4/app/FragmentActivity;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {p1, v1, p2, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 25
    .local v0, "view":Landroid/view/View;
    :try_start_0
    invoke-virtual {p0}, Lcom/disney/id/android/DIDProgress;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const-string v2, "did_progress_bar"

    const-string v3, "id"

    invoke-virtual {p0}, Lcom/disney/id/android/DIDProgress;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v4

    invoke-virtual {v4}, Landroid/support/v4/app/FragmentActivity;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ProgressBar;

    iput-object v1, p0, Lcom/disney/id/android/DIDProgress;->mProgressBar:Landroid/widget/ProgressBar;
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    .line 28
    :goto_0
    return-object v0

    .line 27
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public onDestroyView()V
    .locals 1

    .prologue
    .line 45
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onDestroyView()V

    .line 46
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/disney/id/android/DIDProgress;->mProgressBar:Landroid/widget/ProgressBar;

    .line 47
    return-void
.end method

.method public setProgress(I)V
    .locals 1
    .param p1, "progress"    # I

    .prologue
    .line 38
    iget-object v0, p0, Lcom/disney/id/android/DIDProgress;->mProgressBar:Landroid/widget/ProgressBar;

    if-eqz v0, :cond_0

    .line 39
    iget-object v0, p0, Lcom/disney/id/android/DIDProgress;->mProgressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v0, p1}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 41
    :cond_0
    return-void
.end method
